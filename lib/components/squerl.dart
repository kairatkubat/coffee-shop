import 'package:flutter/material.dart';

class Squere extends StatelessWidget {

  final Function()? onTap;
  final String imagePath;
  const Squere({super.key, 
  required this.imagePath, 
  required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(7),
        child: Image.asset(
          imagePath,
          height: 40,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.5)
          
        ),
      ),
    );
  }
}