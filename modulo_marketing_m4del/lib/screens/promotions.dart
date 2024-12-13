import 'package:flutter/material.dart';
import 'promotion_details.dart';

class Promotions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 212, 212), // Sobrescribir el color de AppBar en una vista específica
      appBar: AppBar(title: Text('Promociones')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Promoción 1'),
            onTap: () => Navigator.pushNamed(context, '/promotionDetails'),
          ),
        ],
      ),
    );
  }
}
