import 'package:cuidapet_leia/app/core/helpers/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

import 'package:cuidapet_leia/app/core/local_stoge/local_storage.dart';
import 'package:cuidapet_leia/app/models/user_model.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  final LocalStorage _localStorage;

  @readonly
  UserModel? _userLogged;
  AuthStoreBase({
    required LocalStorage localStorage,
  }) : _localStorage = localStorage;

  @action
  Future<void> loadUserLogged() async {
    final userModelJson = await _localStorage
        .read<String>(Constants.LOCAL_STORAGE_USER_LOGGED_DATA_KEY);
   

    if (userModelJson != null) {
      _userLogged = UserModel.fromJson(userModelJson);
    } else {
      _userLogged = UserModel.empty();
    }

    FirebaseAuth.instance.authStateChanges().listen((user)async { 
      if (user == null) {
       await logout();
      }

    });
  }
  @action
  Future<void> logout()async{
  await _localStorage.clear();
        _userLogged = UserModel.empty();
}
}


