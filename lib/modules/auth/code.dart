import 'package:flutter/material.dart';

class Code extends StatefulWidget {
  const Code({super.key});

  @override
  State<Code> createState() => _CodeState();
}

class _CodeState extends State<Code> {
  final TextEditingController _codecontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validatecode(String? value){

    if(value == null || value.isEmpty){
      return 'Ingrese un código de verificación';
    }else if(value.length<4){
      return 'El código ingresado es incorrecto';
    }else{
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Código de verificación'),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset('assets/logo.png',height: 200,width: 200,),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: _codecontroller,
                  validator: validatecode,
                  decoration: const InputDecoration(
                    hintText: 'Código de verifiación',
                    label: Text('Código de verificación'),
                  ),
                ),
                const SizedBox(height: 16,),
                ElevatedButton(onPressed: (){
                  //Navigator.pushReplacementNamed(context, '/passwords');
                  if(_formKey.currentState!.validate()){
                    Navigator.pushReplacementNamed(context, '/passwords');
                  }
                }, child: const Text('Validar código'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}