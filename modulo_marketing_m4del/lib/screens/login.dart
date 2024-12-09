import 'package:flutter/material.dart';
import 'home.dart'; // Asegúrate de que la ruta sea correcta para tu pantalla Home
import 'register.dart'; // Importa la pantalla de registro
import 'forgotPassword.dart'; // Importa la pantalla de recuperación de contraseña

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Simula un usuario registrado (esto se puede mejorar con autenticación real)
  final String _registeredEmail = "user@m4del.com";
  final String _registeredPassword = "123"; 

  void _login() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;

      // Verificar si las credenciales coinciden con las del usuario registrado
      if (email == _registeredEmail && password == _registeredPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Inicio de sesión exitoso')),
        );

        // Redirigir al home y pasar el valor de éxito
        Navigator.pop(context, true); // Regresa verdadero para indicar que inició sesión
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Acceso denegado')),
        );
      }
    }
  }

  void _navigateToRegister() {
    // Navegar a la pantalla de registro
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Register()), // Redirige a la pantalla de registro
    );
  }

  void _resetPassword() {
    // Navegar a la pantalla de recuperación de contraseña
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgotPassword()), // Redirige a la pantalla de recuperación de contraseña
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesión'),
      ),
      body: Center(  // Usamos Center para centrar el contenido
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,  // Asociamos el formulario a la clave global
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centra el contenido
              children: [
                // Campo para correo electrónico
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Correo electrónico',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu correo electrónico';
                    }
                    // Validación simple para el formato del correo
                    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$").hasMatch(value)) {
                      return 'Por favor ingresa un correo electrónico válido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                
                // Campo para contraseña
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu contraseña';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                
                // Botón para iniciar sesión
                ElevatedButton(
                  onPressed: _login,
                  child: Text('Iniciar Sesión'),
                ),
                SizedBox(height: 16),
                
                // Texto explicativo de las opciones adicionales
                Text(
                  '¿No tienes una cuenta?',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                
                // Botones para Registrar o Recuperar Contraseña
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: _navigateToRegister,
                      child: Text('Regístrate aquí'),
                    ),
                    SizedBox(width: 16),
                    TextButton(
                      onPressed: _resetPassword,
                      child: Text('¿Olvidaste tu contraseña?'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
