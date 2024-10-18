import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _passwordconfirmationcontroller =
      TextEditingController();

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

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese una contraseña';
    } else {
      return null;
    }
  }

  String? validatePasswordConfirm(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese una contraseña';
    } else if (value != _passwordcontroller.text) {
      return 'Las contraseñas no coinciden';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear cuenta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset('assets/logo.png',height: 200,width: 200,),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                validator: validateEmail,
                controller: _emailcontroller,
                decoration: const InputDecoration(
                  hintText: 'Correo electrónico',
                  label: Text('Correo electrónico'),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: _passwordcontroller,
                validator: validatePassword,
                decoration: const InputDecoration(
                  hintText: 'Contraseña',
                  label: Text('Contraseña'),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                validator: validatePasswordConfirm,
                controller: _passwordconfirmationcontroller,
                decoration: const InputDecoration(
                  hintText: 'Confirmar contraseña',
                  label: Text('Confirmar contraseña'),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: _emailcontroller.text,
                            password: _passwordcontroller.text,
                          );
                          print('CREDENCIAL: $credential');
                          Navigator.pushNamedAndRemoveUntil(context, '/home', (Route<dynamic> route) => false);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                    child: const Text('Crear cuenta')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
