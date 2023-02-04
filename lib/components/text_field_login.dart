import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final style; 
  final controller;
  final String hintText;
  final bool obscureText;
  const LoginTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.style
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: controller,
                obscureText: obscureText ,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      ),
                      fillColor: Colors.grey.withOpacity(0.5),
                      filled: true,
                      hintText: hintText, 
                      hintStyle: TextStyle(color: Colors.white70)
                       
                ),
                textInputAction: TextInputAction.go,
                
              ),
            );
  }
}