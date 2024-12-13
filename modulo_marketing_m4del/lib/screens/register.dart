import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';  // Importa el CustomButton
import '../widgets/custom_text_field.dart';  // Importa el CustomTextField

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _register() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuario registrado exitosamente')),
      );
      Navigator.pop(context);  // Regresa al login
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 212, 212), // Sobrescribir el color de AppBar en una vista específica
      appBar: AppBar(title: Text('Registrar Cuenta')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Crea una cuenta para poder acceder a todas las funcionalidades.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                CustomTextField(
                  label: 'Correo electrónico',
                  controller: _emailController,
                ),
                SizedBox(height: 16),
                CustomTextField(
                  label: 'Contraseña',
                  controller: _passwordController,
                  obscureText: true,
                ),
                SizedBox(height: 16),
                CustomButton(
                  text: 'Registrar',
                  onPressed: _register,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
