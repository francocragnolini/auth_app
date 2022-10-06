import 'package:auth_app/services/google_signin_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("AuthApp - Google - Apple"),
          //boton para hacer el signout
          actions: [
            IconButton(
                onPressed: () {
                  //TODO: signout
                  GoogleSignInService.signOut();
                },
                icon: const Icon(FontAwesomeIcons.doorOpen))
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  splashColor: Colors.transparent,
                  minWidth: double.infinity,
                  height: 40,
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () {
                    //TODO: sign in with google
                    GoogleSignInService.signInWithGoogle();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                      ),
                      Text(
                        "Sign in with Google",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
