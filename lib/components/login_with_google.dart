import 'package:copy/components/squerl.dart';
import 'package:copy/services/auth_services.dart';
import 'package:flutter/material.dart';

class LoginWithAccount extends StatelessWidget {
  const LoginWithAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child:
               Divider(thickness: 0.5, color: Colors.grey,)
               ),
               Text("Or login with",
               style: TextStyle(color: Colors.white)
               ,),
                Expanded(child:
               Divider(thickness: 0.5, color: Colors.grey,),
               ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Squere( onTap: () => AuthService().signInGoogle(),
                imagePath: 'images/google.png'),
              SizedBox(width: 50,),
              Squere(onTap: () { },
                imagePath: 'images/appleicon.png')
            ],
           ),
        ],
      ),
    );
  }
}