import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final db = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
    (() async => {
          await db.collection("restaurants").get().then((event) {
            for (var doc in event.docs) {
              print("${doc.id} => ${doc.data()}");
            }
          })
        })();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Bienvenido'),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, '/');
                  print('Cerrando sesión');
                },
                child: const Text('Cerrar sesión'))
          ],
        ),
      ),
    );
  }
}
