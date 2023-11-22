import 'package:cuidapet_leia/app/core/helpers/constants.dart';
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
      print(_userLogged);
    } else {
      _userLogged = UserModel.empty();
    }
  }
}
