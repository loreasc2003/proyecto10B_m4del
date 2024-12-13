import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final _nameController = TextEditingController();
  final _brandController = TextEditingController();
  final _barcodeController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _presentationController = TextEditingController();
  final _priceController = TextEditingController();
  final _photoController = TextEditingController();
  final _statusController = TextEditingController();

  void _addProduct(BuildContext context) {
    // Aquí puedes agregar la lógica para agregar el producto
    Navigator.pop(context); // Regresa a la lista de productos
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 212, 212), // Sobrescribir el color de AppBar en una vista específica
      appBar: AppBar(title: const Text('Detalles del Producto')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nombre del producto'),
            ),
            TextField(
              controller: _brandController,
              decoration: const InputDecoration(labelText: 'Marca'),
            ),
            TextField(
              controller: _barcodeController,
              decoration: const InputDecoration(labelText: 'Código de barras'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
            ),
            TextField(
              controller: _presentationController,
              decoration: const InputDecoration(labelText: 'Presentación'),
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Precio actual'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _photoController,
              decoration: const InputDecoration(labelText: 'Fotografía (URL)'),
            ),
            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(value: 'Activo', child: Text('Activo')),
                DropdownMenuItem(value: 'Inactivo', child: Text('Inactivo')),
              ],
              onChanged: (value) {
                _statusController.text = value ?? '';
              },
              decoration: const InputDecoration(labelText: 'Estatus'),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => _addProduct(context),
                child: const Text('Agregar Producto'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
