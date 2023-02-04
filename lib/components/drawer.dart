import 'package:copy/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DrawerHome extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
   DrawerHome({super.key});


void SignUserOut(){
  FirebaseAuth.instance.signOut();  
}
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      color: Color.fromARGB(255, 184, 180, 180),
           child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
      SizedBox(
        height: 150,
        child:  DrawerHeader(
          
          padding: EdgeInsets.all(30),
          decoration: const BoxDecoration(
            color: Color(0xFFE57734),
          ),
          
          child: Row(
            children: [
              const Icon(Icons.person),
              Text(user.email!),
              IconButton(onPressed: SignUserOut, icon: const Icon(Icons.logout)),
              
            ],
          ),
        ),
      ),
      ListTile(
        title: const Text('Back to Home Screen'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        },
      ),
      ListTile(
        title: const Text('Item 2'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
      ListTile(
        title: const Text("Log out"),
        onTap: SignUserOut)
    ],
  ),
    );
  }
}