import 'package:cuidapet_leia/app/core/helpers/constants.dart';
import 'package:cuidapet_leia/app/core/local_stoge/local_storage.dart';
import 'package:cuidapet_leia/app/core/logger/app_logger.dart';
import 'package:cuidapet_leia/app/core/rest_client/rest_client.dart';
import 'package:cuidapet_leia/app/exceptions/failure_exception.dart';
import 'package:cuidapet_leia/app/exceptions/user_existe_exception.dart';
import 'package:cuidapet_leia/app/exceptions/user_notexists_exception.dart';
import 'package:cuidapet_leia/app/repositories/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import './user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;
  final AppLogger _log;
   final LocalStorage _localStorage;

  UserServiceImpl({
    required UserRepository userRepository,
    required AppLogger log,
     required LocalStorage localStorage,
  })  : _userRepository = userRepository,
        _log = log,
          _localStorage = localStorage;

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

        final accessToken = await _userRepository.login(email, password);

         await _saveAccessToken(accessToken);
       
      }

    } on FirebaseAuthException catch (e, s) {
      print(e);
    }
  
  

}
Future<void>  _saveAccessToken(String accessToken) => _localStorage.write<String>(Constants.LOCAL_STORAGE_ACCESSTOKEN_KEY, accessToken);



}