import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';  // Importa el CustomButton
import '../widgets/custom_text_field.dart';  // Importa el CustomTextField
import 'register.dart';  // Asegúrate de importar la pantalla de registro
import 'forgot_password.dart';  // Asegúrate de importar la pantalla de recuperación de contraseña

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Aquí puedes agregar la lógica de inicio de sesión real
      Navigator.pop(context, true);  // Retorna un valor verdadero para indicar inicio de sesión
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 212, 212), // Sobrescribir el color de AppBar en una vista específica
      appBar: AppBar(title: Text('Iniciar Sesión')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                text: 'Iniciar Sesión',
                onPressed: _login,
              ),
              SizedBox(height: 16),
              // Botón de "Iniciar sesión con Google" con icono
              CustomButton(
                text: 'Iniciar sesión con Google',
                onPressed: () {
                  // Aquí puedes agregar la lógica para el login con Google
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Función de Google no disponible')),
                  );
                },
              ),
              SizedBox(height: 16),
              // Nuevo botón para ir a la pantalla de "Registrar"
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                },
                child: Text(
                  '¿No tienes cuenta? Regístrate',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              SizedBox(height: 8),
              // Nuevo botón para ir a la pantalla de "Recuperar Contraseña"
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPassword()),
                  );
                },
                child: Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
