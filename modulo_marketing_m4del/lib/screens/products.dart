import 'package:flutter/material.dart';
import 'product_details.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 212, 212), // Sobrescribir el color de AppBar en una vista específica
      appBar: AppBar(title: Text('Productos')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Producto 1'),
            onTap: () => Navigator.pushNamed(context, '/productDetails'),
          ),
          ListTile(
            title: Text('Producto 2'),
            onTap: () => Navigator.pushNamed(context, '/productDetails'),
          ),
        ],
      ),
    );
  }
}
