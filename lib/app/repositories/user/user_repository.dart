import 'package:cuidapet_leia/app/models/confirm_login_model.dart';

abstract class UserRepository {
  Future<void> register(String email, String password);
  Future<String> login(String email, String password);
  Future<ConfirLoginModel> confirmeLogin();

}
