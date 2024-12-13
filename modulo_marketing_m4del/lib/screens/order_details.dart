import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  final _orderController = TextEditingController();

  void _addOrder(BuildContext context) {
    // Aquí puedes agregar la lógica para agregar el pedido
    Navigator.pop(context); // Regresa a la lista de pedidos
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 212, 212), // Sobrescribir el color de AppBar en una vista específica
      appBar: AppBar(title: Text('Detalles del Pedido')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _orderController, decoration: InputDecoration(labelText: 'Detalles del pedido')),
            ElevatedButton(
              onPressed: () => _addOrder(context),
              child: Text('Agregar Pedido'),
            ),
          ],
        ),
      ),
    );
  }
}
