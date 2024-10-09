import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  /* variables para correo y contraseña, al igual que una llave para el formulario*/
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool _isObscure = true;

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

String? validatePassword(String? value){
  if(value==null || value.isEmpty){
    return 'Ingrese una contraseña';
  }else{
    return null;
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login'),),
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
                  controller: _emailcontroller,
                  decoration: const InputDecoration(
                    hintText: 'Correo electronico',
                    label: Text('Correo electronico')
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 32,),
                TextFormField(
                  validator: validatePassword,
                  controller: _passwordcontroller,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    label: const Text('Contraseña'),
                    suffixIcon: IconButton(onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },icon: Icon(_isObscure?Icons.visibility:Icons.visibility_off))
                  ),
                ),
                const SizedBox(height: 32,),
                ElevatedButton(child: const Text('Iniciar sesión'), onPressed: () {
                  if(_formKey.currentState!.validate()){
                    Navigator.pushReplacementNamed(context, '');
                  }
                },),
                const SizedBox(height: 16,),
                SizedBox(
                  child: ElevatedButton(onPressed: () {
                    Navigator.pushNamed(context, '/recovery');
                  },
                  style: OutlinedButton.styleFrom(
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                  ), child: const Text('Recuperar contraseña',style: TextStyle(decoration: TextDecoration.underline,),),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}