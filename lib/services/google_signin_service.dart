import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

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

      //TODO: id token: autenticar contra nuestro backend
      final googleKey = await account?.authentication;
      //print("=======ID TOKEN======");
      //print(googleKey!.idToken);

      //TODO: llamar un servicio rest a nuestro backend
      //con el idToken
      final signInWithGoogleEndpoint = Uri(
        scheme: "https",
        host: 'google-signin-flutter-backend.herokuapp.com',
        path: '/auth/google',
      );

      final session = await http
          .post(signInWithGoogleEndpoint, body: {"token": googleKey!.idToken});

      print("======= backend =========");
      print(session.body);

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
