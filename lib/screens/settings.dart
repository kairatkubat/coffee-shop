import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingPage extends StatelessWidget {
  bool ifLoggedOut = false;
  final user = FirebaseAuth.instance.currentUser!;
   SettingPage({super.key});
void SignUserOut(){
  FirebaseAuth.instance.signOut(); 
  ifLoggedOut = !ifLoggedOut; 
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: SignUserOut, icon: Icon(Icons.logout)),
        
      ],
      automaticallyImplyLeading: false,
      title: Text("Settings",),
       systemOverlayStyle: SystemUiOverlayStyle.light,),
       body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Icon(Icons.person, size: 100,),
          ),
          Text(user.email!, style: TextStyle(fontSize: 29),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("Kairat", style: style,),
            SizedBox(width: 30,),
            Text("Tentiev", style: style,)
          ],),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("phone: ", style: stylekey,),
                Text(user.phoneNumber.toString(), style: style,)
              ],
            ),
          )
        ],
       ),
    );
  }
  final style = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold

  );
  final stylekey = TextStyle(
    fontSize: 15,
     color: Colors.blue[200],
     fontWeight: FontWeight.bold,
  );
}

