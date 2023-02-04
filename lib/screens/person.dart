
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Person extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
 Person({super.key});
//sign user out

void SignUserOut(){
  FirebaseAuth.instance.signOut();  
}
  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
        appBar: AppBar(actions: [
          IconButton(onPressed: SignUserOut, icon: Icon(Icons.logout))
        ]
        ),
        body: Column(
          children: [
            Text("Logged in " + user.email!)
          ],
        ),
       );
  }
}