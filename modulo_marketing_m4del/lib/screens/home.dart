import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class GymHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BULL´S GYM'),
      ),
      drawer: GymDrawer(), // Incluye el Drawer
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Agrega padding alrededor del cuerpo
        child: Center(
          child: Text(
            'Bienvenido al modulo de ventas',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.grey,
        padding: EdgeInsets.all(16), // Padding ya está aquí en el contenedor del footer
        child: Text(
          'Contáctanos: m4del@gym.com',
          style: TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
