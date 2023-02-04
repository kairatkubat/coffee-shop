
import 'package:copy/screens/home_page.dart';
import 'package:copy/screens/login_or_register.dart';
import 'package:copy/screens/login_page.dart';
import 'package:copy/screens/person.dart';
import 'package:copy/screens/well_come.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot) {
        //user is logged in
        if(snapshot.hasData){
          return HomePage();
        }
        //user is not logged in
        else {
          return LoginOrRegisterPage();}
      }
      ),
      
      ),
    );
  }
}