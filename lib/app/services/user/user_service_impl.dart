import 'package:cuidapet_leia/app/core/helpers/constants.dart';
import 'package:cuidapet_leia/app/core/local_stoge/local_storage.dart';
import 'package:cuidapet_leia/app/core/logger/app_logger.dart';
import 'package:cuidapet_leia/app/exceptions/failure_exception.dart';
import 'package:cuidapet_leia/app/exceptions/user_notexists_exception.dart';
import 'package:cuidapet_leia/app/models/social_login_type.dart';
import 'package:cuidapet_leia/app/models/social_network_model.dart';
import 'package:cuidapet_leia/app/repositories/social/social_repository.dart';
import 'package:cuidapet_leia/app/repositories/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;
  final AppLogger _log;
  final LocalStorage _localStorage;
  final LocalSecureStorage _localSecureStoge;
  final SocialRepository _socialRepository;

  UserServiceImpl({
    required UserRepository userRepository,
    required AppLogger log,
    required LocalStorage localStorage,
    required LocalSecureStorage localSecureStoge,
    required SocialRepository socialRepository,
  })  : _userRepository = userRepository,
        _log = log,
        _localStorage = localStorage,
        _localSecureStoge = localSecureStoge,
        _socialRepository =socialRepository;

  @override
  Future<void> register(String email, String password) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;
      final userMethods = await firebaseAuth.fetchSignInMethodsForEmail(email);

      if (userMethods.isNotEmpty) {
        throw UserNotExistsException();
      }

      await _userRepository.register(email, password);
      final userRegisterCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userRegisterCredential.user?.sendEmailVerification();
    } on FirebaseException catch (e, s) {
      _log.error('Erro ao criar usuário no firebase.', e, s);
      throw FailureException(message: 'Erro ao criar usuário.');
    }
  }

  @override
  Future<void> login(String email, String password) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;
      final loginMethods = await firebaseAuth.fetchSignInMethodsForEmail(email);

      if (loginMethods.isEmpty) {
        throw UserNotExistsException();
      }

      if (loginMethods.contains('password')) {
        final userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        final userVerified = userCredential.user?.emailVerified ?? false;

        if (!userVerified) {
          userCredential.user?.sendEmailVerification();
          throw FailureException(
              message:
                  'E-mail não confirmado, por favor verifique sua caixa de spam.');
        }
      }
      final accessToken = await _userRepository.login(email, password);

      await _saveAccessToken(accessToken);
      await _confirmLogin();
      await _getUserData();
    } on FirebaseAuthException catch (e, s) {
      _log.error('Erro ao realizar login com ', e, s);
      throw FailureException(message: 'Erro ao realizar login.');
    }
  }

  Future<void> _saveAccessToken(String accessToken) => _localStorage
      .write<String>(Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY, accessToken);

  Future<void> _confirmLogin() async {
    final confirmLoginModel = await _userRepository.confirmeLogin();
    await _saveAccessToken(confirmLoginModel.accessToken);

    await _localSecureStoge.write<String>(
        Constants.LOCAL_STORAGE_REFRESH_TOKEN_KEY,
        confirmLoginModel.refreshToken);
  }

  Future<void> _getUserData() async {
    final userModel = await _userRepository.getUserLogged();

    await _localStorage.write<String>(
        Constants.LOCAL_STORAGE_USER_LOGGED_DATA_KEY, userModel.toJson());
  }

  @override
  Future<void> socialLogin(SocialLoginType socialLoginType)async {
try{
     final SocialNetworkModel socialModel;
      final AuthCredential authCredential;
      final firebaseAuth = FirebaseAuth.instance;

      switch (socialLoginType) {
        case SocialLoginType.google:
          socialModel = await _socialRepository.googleLogin();
          authCredential = GoogleAuthProvider.credential(
            accessToken: socialModel.accessToken,
            idToken: socialModel.id,
          );
          break;
        case SocialLoginType.facebook:
          socialModel = await _socialRepository.facebookLogin();
          authCredential = FacebookAuthProvider.credential(
            socialModel.accessToken,
          );
          break;
      }

      final loginMethods =
          await firebaseAuth.fetchSignInMethodsForEmail(socialModel.email);

      final methodCheck = _getMethodSocialLoginType(socialLoginType);

      if (loginMethods.isNotEmpty && !loginMethods.contains(methodCheck)) {
        throw FailureException(
            message:
                'Login não pode ser feito por $methodCheck, por favor utilize outro método.');
      }

      final userCredential =
          await firebaseAuth.signInWithCredential(authCredential);

      final userVerified = userCredential.user?.emailVerified ?? false;

      if (!userVerified) {
        userCredential.user?.sendEmailVerification();
        throw FailureException(
            message:
                'E-mail não confirmado, por favor verifique sua caixa de spam.');
      }

      final accessToken = await _userRepository.loginSocial(socialModel);
      await _saveAccessToken(accessToken);
      await _confirmLogin();
      await _getUserData();
    } on FirebaseAuthException catch (e, s) {
      _log.error('Erro ao realizar login com $socialLoginType', e, s);
      throw FailureException(message: 'Erro ao realizar login.');
    }
  }

  String _getMethodSocialLoginType(SocialLoginType socialLoginType) {
    switch (socialLoginType) {
      case SocialLoginType.google:
        return 'google.com';

      case SocialLoginType.facebook:
        return 'facebook.com';
        
    }
  }
  
 
  
}
