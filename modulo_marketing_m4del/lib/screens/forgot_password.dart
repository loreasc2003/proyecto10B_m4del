import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';  // Importa el CustomButton
import '../widgets/custom_text_field.dart';  // Importa el CustomTextField

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _recuperarContrasena() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Correo de recuperación enviado')),
      );
      Navigator.pop(context);  // Regresa al login
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 212, 212), // Sobrescribir el color de AppBar en una vista específica
      appBar: AppBar(title: Text('Recuperar Contraseña')),
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
                  'Por favor ingrese su correo electrónico para recuperar su contraseña.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                CustomTextField(
                  label: 'Correo electrónico',
                  controller: _emailController,
                ),
                SizedBox(height: 16),
                CustomButton(
                  text: 'Recuperar Contraseña',
                  onPressed: _recuperarContrasena,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
