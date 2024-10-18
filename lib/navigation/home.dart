import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio'),),
      body: Center(
        child: Column(
          children: [
            const Text('Bienvenido'),
            const SizedBox(height: 32,),
            ElevatedButton(onPressed: ()async{
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/');
              print('Cerrando sesión');
            }, child: const Text('Cerrar sesión'))
          ],
        ),
      ),
    );
  }
}