import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _repitepasswordcontroller = TextEditingController();
  bool _isObscure1 = true;
  bool _isObscure2 = true;

  String? validatepassword(String? value){
    if(value == null || value.isEmpty){
      return 'Ingrese una contraseña';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nueva contraseña'),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset('assets/logo.png', height: 200, width: 200),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: _isObscure1,
                  validator: validatepassword,
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                    hintText: 'Nueva contraseña',
                    label: const Text('Nueva contraseña'),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscure1 = !_isObscure1;
                        });
                      },
                      icon: Icon(
                        _isObscure1 ? Icons.visibility : Icons.visibility_off
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: _isObscure2,
                  validator: validatepassword,
                  controller: _repitepasswordcontroller,
                  decoration: InputDecoration(
                    hintText: 'Repetir contraseña',
                    label: const Text('Repetir contraseña'),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscure2 = !_isObscure2;
                        });
                      },
                      icon: Icon(
                        _isObscure2 ? Icons.visibility : Icons.visibility_off
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamedAndRemoveUntil(
                        context, 
                        '/', 
                        (Route<dynamic> routes) => false
                      );
                    }
                  }, 
                  child: const Text('Guardar')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
