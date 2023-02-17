
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'login_page.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _intitalization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _intitalization,
        builder: (context, snapshot) {
          //if snapshot has error
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("Error: ${snapshot.error}"),
              ),
            );
          }
          //Connection intitalized -- Firebase App is running
          if (snapshot.connectionState == ConnectionState.done) {
            return LoginPage();

          }else
            //user is logged in head to home page
            return HomePage();



        });
  }
}
