import 'package:copy/components/login_with_google.dart';
import 'package:copy/components/my_button.dart';
import 'package:copy/components/text_field_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap; 
   RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailcontroller = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final phoneNumber = TextEditingController();

  void SignUserInUp() async {
    // user wait loading
     showDialog(context: context,
      builder: (context){
        return const Center(
            child: CircularProgressIndicator(),
        );
      }
      );
// create a user 
    try{
      //check if confirm and password are equal
      if(password.text == confirmPassword.text)
      {
         await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailcontroller.text, password: password.text);
      }
      else{
         //show error message
          ErrorMessage("Password does not match");
      }

      Navigator.pop(context);
    } on FirebaseAuthException catch (e){
      Navigator.pop(context); 

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
                Icon(Icons.create, size: 100,),
                SizedBox(height: 50,), 
                Text("Register your account ",
                 style: TextStyle(color: Colors.grey[700],fontSize: 22)
                 
                 ,),
                 SizedBox(height: 25,), 
                 LoginTextField( 
                  controller: emailcontroller, hintText: "email", obscureText: false,
                  ),
                  SizedBox(height: 5,), 
                 LoginTextField(controller: password, hintText: "password", obscureText: true
                 ),
                 SizedBox(height: 5,),
                 LoginTextField(controller: confirmPassword, hintText: "confirm password", obscureText: true
                 ),
                  SizedBox(height: 5,),
                 LoginTextField(controller: phoneNumber, hintText: "phone number", obscureText: false
                 ),
                SizedBox(height: 25,),
                MyButton(onTap: SignUserInUp , String: "Sign Up",
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
                   style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700
                   
                   ),),
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
