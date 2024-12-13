import 'package:flutter/material.dart';
import 'order_details.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 212, 212), // Sobrescribir el color de AppBar en una vista específica
      appBar: AppBar(title: Text('Pedidos')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Pedido 1'),
            onTap: () => Navigator.pushNamed(context, '/orderDetails'),
          ),
        ],
      ),
    );
  }
}
