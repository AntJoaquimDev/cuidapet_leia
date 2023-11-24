import 'package:cuidapet_leia/app/models/confirm_login_model.dart';
import 'package:cuidapet_leia/app/models/social_network_model.dart';
import 'package:cuidapet_leia/app/models/user_model.dart';

abstract class UserRepository {
  Future<void> register(String email, String password);
  Future<String> login(String email, String password);
   Future<String> loginSocial(SocialNetworkModel model);
  Future<ConfirLoginModel> confirmeLogin();
   Future<UserModel> getUserLogged();
  

}
