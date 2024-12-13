import 'package:flutter/material.dart';

class PromotionDetails extends StatelessWidget {
  final _promotionController = TextEditingController();

  void _addPromotion(BuildContext context) {
    // Aquí puedes agregar la lógica para agregar la promoción
    Navigator.pop(context); // Regresa a la lista de promociones
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 212, 212), // Sobrescribir el color de AppBar en una vista específica
      appBar: AppBar(title: Text('Detalles de la Promoción')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _promotionController, decoration: InputDecoration(labelText: 'Detalles de la promoción')),
            ElevatedButton(
              onPressed: () => _addPromotion(context),
              child: Text('Agregar Promoción'),
            ),
          ],
        ),
      ),
    );
  }
}
