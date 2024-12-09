import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Función para simular el proceso de recuperación de contraseña
  void _recuperarContrasena() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Correo de recuperación enviado')),
      );
      Navigator.pop(context); // Regresa al login
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperar Contraseña'),
      ),
      body: Center(  // Usamos el widget Center para centrar todo el contenido
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,  // Asocia el formulario a la clave global
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centra el contenido verticalmente
              crossAxisAlignment: CrossAxisAlignment.center, // Centra el contenido horizontalmente
              children: [
                Text(
                  'Por favor ingrese su correo electrónico para recuperar su contraseña.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Correo electrónico',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su correo electrónico';
                    }
                    // Validación simple de correo electrónico
                    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$").hasMatch(value)) {
                      return 'Por favor ingrese un correo electrónico válido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _recuperarContrasena,  // Llama a la función de recuperación
                  child: Text('Recuperar Contraseña'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
