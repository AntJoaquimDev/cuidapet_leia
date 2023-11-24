import 'package:cuidapet_leia/app/exceptions/failure_exception.dart';
import 'package:cuidapet_leia/app/models/social_network_model.dart';
import 'package:cuidapet_leia/app/modules/auth/login/widgets/message_alert.dart';
import 'package:cuidapet_leia/app/repositories/social/social_repository.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialRepositoryImpl implements SocialRepository {
  @override
  Future<SocialNetworkModel> facebookLogin() async {
    final facebookAuth = FacebookAuth.instance;
    final result = await facebookAuth.login();
    switch (result.status) {
      case LoginStatus.success:
        final userData = await facebookAuth.getUserData();
        return SocialNetworkModel(
          id: userData['id'],
          name: userData['name'],
          email: userData['email'],
          type: 'Facebook',
          avatar: userData['picture']['data']['url'],
          accessToken: result.accessToken?.token ?? '',
        );
      case LoginStatus.cancelled:
        throw FailureException(message: 'Login cancelado.');
      case LoginStatus.failed:
      case LoginStatus.operationInProgress:
        throw FailureException(message: result.message);
    }
  }

  @override
  Future<SocialNetworkModel> googleLogin() async {
    final googleSignIn = GoogleSignIn();

    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.disconnect();
    }

    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;

    if (googleAuth != null && googleUser != null) {
      return SocialNetworkModel(
        id: googleAuth.idToken ?? '',
        name: googleUser.displayName ?? '',
        email: googleUser.email,
        type: 'Google',
        avatar: googleUser.photoUrl,
        accessToken: googleAuth.accessToken ?? '',
      );
    } else {
      MessageAlert.alert('Erro ao realizar login com o google.');
      throw FailureException(message: 'Erro ao realizar login com o google.');
    }
  }
}
