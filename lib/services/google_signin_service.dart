import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  //metodo
  static GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  //metodo
  static Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();

      print(account);

      //TODO: id token

      return account;
    } catch (e) {
      print("error en google signIn");
      print(e);
      return null;
    }
  }

  static Future signOut() async {
    await _googleSignIn.signOut();
  }
}
