import 'package:copy/components/drawer.dart';
import 'package:copy/screens/Products.dart';
import 'package:copy/screens/home_screen.dart';

import 'package:copy/screens/person.dart';
import 'package:copy/screens/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_Cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int _selectedTab = 0;

  final List _pages =[
   const HomeScreen(),
  //  Person(),
  MyCart(),
   Products(), 
  
    SettingPage()
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
    backgroundColor: Colors.grey,
    body: _pages[_selectedTab],
    bottomNavigationBar: Theme(
    data: ThemeData(canvasColor: Colors.grey),
    child: BottomNavigationBar(
      
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: const Color(0xFFE57734),
        unselectedItemColor: Colors.white,
        items: const [
           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home") ,
           BottomNavigationBarItem(icon: Icon(Icons.local_grocery_store), label: "Cart"),
           BottomNavigationBarItem(
              icon: Icon(Icons.list), label: "Product"
              
              ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    )
    );

  
  }
}