import 'package:flutter/material.dart';

class Promociones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: Text('Promociones'),
  ),
  body: Center(
    child: Text('Aquí irán las promociones del gimnasio.'),
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
