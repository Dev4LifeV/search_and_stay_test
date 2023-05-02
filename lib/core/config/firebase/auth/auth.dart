import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:search_and_stay_test/core/config/firebase/firebase_remote_config.dart';
import 'package:search_and_stay_test/core/config/injector.dart';
import 'package:search_and_stay_test/core/model/token.dart';

class Authentication {
  static Future<User?> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();

    user = await _onGoogleAccount(googleSignInAccount, auth);

    return user;
  }

  static Future<User?> _onGoogleAccount(
      GoogleSignInAccount? account, FirebaseAuth authInstance) async {
    if (account != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await account.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await authInstance.signInWithCredential(credential);

        final String token = await RemoteConfig.getToken();

        Injector.shared.create<Token, Token>(() => Token(token: token));
        Injector.shared.create<User, User?>(() => userCredential.user);

        return userCredential.user;
      } on FirebaseAuthException {
        rethrow;
      }
    }
    return null;
  }
}
