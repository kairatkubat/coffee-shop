
import 'package:copy/components/login_with_google.dart';
import 'package:copy/components/text_field_login.dart';
import 'package:copy/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class Welcome extends StatelessWidget {
  Welcome({super.key});
  //text editing controller

  final EmailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method

  void signUserIn()async{
await FirebaseAuth.instance.signInWithEmailAndPassword(
  email: EmailController.text.trim(), password: passwordController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.only(top: 100, bottom: 40),
         decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(image: AssetImage("images/bg.png"),
          fit: BoxFit.cover,
          opacity: 0.6 ),

         ),
         child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Coffee Shop ", style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w500,
              color: Colors.white
            ),
            ),
            SizedBox(height: 40,),
            SizedBox(height: 40,),

           LoginTextField(
            controller: EmailController,
            hintText: "User Name",
            obscureText: false,
            
           ),
           LoginTextField(
            controller: passwordController,
            hintText: "password",
            obscureText: true,
           ),
           
           
          LoginWithAccount(),

           

            Column(children: [
              Text("Feeling a Low? Take a Sip of Coffee", style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                letterSpacing: 1, 
              ),
              ),
              SizedBox(height: 80,),
              Material(
                 color: Color(0xFFE57734),
                  borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  // splashColor: Colors.black,
                  onTap: (){
                    // signUserIn;
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>const HomePage(),));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                    child: Text("get start ", style: TextStyle(color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],)
          
         ]),
      ),
    );
  }
}