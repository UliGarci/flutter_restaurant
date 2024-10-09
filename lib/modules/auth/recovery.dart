import 'package:flutter/material.dart';

class Recovery extends StatefulWidget {
  const Recovery({super.key});

  @override
  State<Recovery> createState() => _RecoveryState();
}

class _RecoveryState extends State<Recovery> {
  final TextEditingController _emailcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
  // Expresión regular para validar un correo electrónico
  final RegExp emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  if (value == null || value.isEmpty) {
    return 'Por favor, ingrese su correo electrónico';
  } else if (!emailRegExp.hasMatch(value)) {
    return 'Por favor, ingrese un correo electrónico válido';
  }
  return null; // Si es válido, no devuelve ningún error
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('Recuperar contraseña'),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset('assets/logo.png',width: 200,height: 200,),
                TextFormField(
                  validator: validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailcontroller,
                  decoration: const InputDecoration(
                    hintText: 'Correo electrónico',
                    label: Text('Correo electrónico')
                  ),
                ),
                const SizedBox(height: 16,),
                ElevatedButton(onPressed: () {
                  //Navigator.pushNamed(context, '/code');
                  if(_formKey.currentState!.validate()){
                    Navigator.pushNamed(context, '/code');
                  }
                }, child: const Text('Enviar código'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}