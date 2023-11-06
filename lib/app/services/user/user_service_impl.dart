
import 'package:cuidapet_leia/app/core/logger/app_logger.dart';
import 'package:cuidapet_leia/app/exceptions/failure_exception.dart';
import 'package:cuidapet_leia/app/exceptions/user_existe_exception.dart';
import 'package:cuidapet_leia/app/repositories/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;
  final AppLogger _logger;
  UserServiceImpl({
    required UserRepository userRepository,
    required AppLogger logger, 
   
  })  : _userRepository = userRepository,
        _logger = logger;

  @override
  Future<void> register(String email, String password) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;

      final userMethods = firebaseAuth.fetchSignInMethodsForEmail(email);
      if (userMethods==null) {
        throw UserExisteException();
      }
      await _userRepository.register(email, password);

      final userRegisterCurrent = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await userRegisterCurrent.user?.sendEmailVerification();
    } on FirebaseException catch (e, s) {
      _logger.error('Erro ao Criar usuário no Firebase');
      throw FailureException(message: 'Erro ao criar Usuario');
    }
  }
}
