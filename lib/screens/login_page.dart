import 'package:copy/components/login_with_google.dart';
import 'package:copy/components/my_button.dart';
import 'package:copy/components/text_field_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Log extends StatefulWidget {
  final Function()? onTap; 
   Log({super.key, required this.onTap});

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  final emailcontroller = TextEditingController();
  final password = TextEditingController();

  void SignUserIn() async {
    // user wait loading
     print(emailcontroller.toString());
     showDialog(context: context,
      builder: (context){
        return const Center(
            child: CircularProgressIndicator(),
        );
      }
      );

    try{
       await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailcontroller.text, password: password.text);

      Navigator.pop(context);
    } on FirebaseAuthException catch (e){
      Navigator.pop(context); 
      print(emailcontroller.toString());

      //pop circular
   ErrorMessage(e.code);

    }
  }


  void ErrorMessage(String message){
    showDialog(context: context,
     builder: (context){
      return 
      AlertDialog(
        backgroundColor: Colors.deepOrange,
        title: Center(child: Text(message, 
        style: TextStyle(color: Colors.white),)),
      );
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50,),
                Icon(Icons.lock, size: 100,),
                SizedBox(height: 50,), 
                Text("Welcome, you were missed",
                 style: TextStyle(color: Colors.grey[700],fontSize: 17)
                 
                 ,),
                 SizedBox(height: 25,), 
                 LoginTextField(controller: emailcontroller, hintText: "email", obscureText: false),
                  SizedBox(height: 5,), 
                 LoginTextField(controller: password, hintText: "password", obscureText: true),
                SizedBox(height: 25,),
                MyButton(onTap: SignUserIn, String: "Sign In",
                ),
                SizedBox(height: 25,),
                LoginWithAccount(),
                SizedBox(height: 20,),
                  
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row( 
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Not a member?"),
                SizedBox(width: 25,),
                 GestureDetector(
                  onTap: widget.onTap,
                   child: Text("Register now", 
                   style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),),
                 )
                
                ],),
          )
              ],
            ),
          ),
        ),
      ),
    );
  }
}