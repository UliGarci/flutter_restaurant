import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:restaurante_ulises/firebase_options.dart';
import 'package:restaurante_ulises/modules/auth/code.dart';
import 'package:restaurante_ulises/modules/auth/login.dart';
import 'package:restaurante_ulises/modules/auth/newPassword.dart';
import 'package:restaurante_ulises/modules/auth/recovery.dart';
import 'package:restaurante_ulises/navigation/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context)=> const Login(),
        '/home':(context)=>const Home(),
        '/recovery':(context)=>const Recovery(),
        '/code':(context)=>const Code(),
        '/passwords':(context)=>const NewPassword()
      },
    );
  }
}
