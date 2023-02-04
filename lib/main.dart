
import 'package:copy/components/auth_page.dart';
import 'package:copy/screens/login_page.dart';
import 'package:copy/screens/well_come.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'components/cart_model.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await 
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   darkTheme: ThemeData.light(),
    //   themeMode: ThemeMode.system,
    //   home: AuthPage(), 
    //   // home: AuthPage(), //Welcome()
    // );
    return ChangeNotifierProvider(create: (context) =>CartModel(),
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  AuthPage(),
    ),
    );
  }
}

