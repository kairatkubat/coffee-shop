import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingPage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
   SettingPage({super.key});
void SignUserOut(){
  FirebaseAuth.instance.signOut();  
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: SignUserOut, icon: Icon(Icons.logout))
      ],
      automaticallyImplyLeading: false,
      title: Text("Settings"),
       systemOverlayStyle: SystemUiOverlayStyle.light,),
       body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Icon(Icons.person, size: 100,),
          ),
          Text(user.email!, style: TextStyle(fontSize: 29),)
        ],
       ),
    );
  }
}