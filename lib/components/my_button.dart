import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String;
  const MyButton({super.key, required this.onTap, required this.String});

  @override
  Widget build(BuildContext context) {

    return
       GestureDetector(
        onTap: onTap,
         child: Container( 
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          margin: const EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
          
          height: 50,
          child: Center(
            child: Text(String,style: 
            TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18
            ),),
          ),
             ),
       );
    
  }
}