import 'package:flutter/material.dart';

class Pedidos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: Text('Pedidos'),
  ),
  body: Center(
    child: Text('Aquí irán los pedidos del gimnasio.'),
  ),
  bottomNavigationBar: Container(
    color: Colors.grey,
    padding: EdgeInsets.all(16),
    child: Text(
      'Contáctanos: m4del@gym.com',
      style: TextStyle(fontSize: 14),
      textAlign: TextAlign.center,
    ),
  ),
);

  }
}
