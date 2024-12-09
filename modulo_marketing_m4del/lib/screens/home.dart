import 'package:flutter/material.dart';
import 'login.dart'; // Asegúrate de importar la pantalla de login
import '../widgets/drawer.dart';
 // Importa el GymDrawer

class GymHomePage extends StatefulWidget {
  @override
  _GymHomePageState createState() => _GymHomePageState();
}

class _GymHomePageState extends State<GymHomePage> {
  bool isLoggedIn = false; // Estado de sesión del usuario
  String userEmail = '';  // Correo del usuario

  // Función para manejar el inicio de sesión
  void _login() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()), // Redirige al login
    ).then((value) {
      if (value != null && value) {
        setState(() {
          isLoggedIn = true; // Usuario ha iniciado sesión
          userEmail = 'user@m4del.com'; // Puedes cambiarlo por el correo del usuario logueado
        });
      }
    });
  }

  // Función para manejar el cierre de sesión
  void _logout() {
    setState(() {
      isLoggedIn = false; // Cierra la sesión
      userEmail = ''; // Resetea el correo
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BULL´S GYM'),
        actions: [
          // Si no está logueado, muestra el icono para iniciar sesión
          IconButton(
            icon: Icon(Icons.person),
            onPressed: isLoggedIn
                ? _logout // Si está logueado, cierra sesión
                : _login, // Si no está logueado, muestra la pantalla de login
          ),
        ],
      ),
      drawer: GymDrawer(
        isLoggedIn: isLoggedIn,
        userEmail: userEmail,
        onLogout: _logout, // Pasa la función de logout al drawer
      ),
      body: Center(
        child: Text('Bienvenido al módulo de ventas'),
      ),
    );
  }
}
