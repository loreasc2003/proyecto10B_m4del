import 'package:flutter/material.dart';

class Productos extends StatelessWidget {
  final List<Map<String, dynamic>> productos = [
    {
      'nombre': 'Mancuernas 5kg',
      'imagen': 'https://via.placeholder.com/150',
      'precio': '\$20.00',
      'descripcion': 'Mancuernas ideales para entrenamiento de fuerza.',
      'detalles': 'Material: hierro, peso: 5kg cada una, color: negro.'
    },
    {
      'nombre': 'Colchoneta Yoga',
      'imagen': 'https://via.placeholder.com/150',
      'precio': '\$15.00',
      'descripcion': 'Colchoneta antideslizante para yoga y pilates.',
      'detalles': 'Dimensiones: 180x60cm, grosor: 6mm, material: PVC.'
    },
    {
      'nombre': 'Cuerda para saltar',
      'imagen': 'https://via.placeholder.com/150',
      'precio': '\$10.00',
      'descripcion': 'Cuerda ajustable para mejorar tu cardio.',
      'detalles': 'Longitud ajustable, material: nylon, asas ergonómicas.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          final producto = productos[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Image.network(
                producto['imagen'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(producto['nombre']),
              subtitle: Text('${producto['descripcion']} - ${producto['precio']}'),
              onTap: () {
                // Navegar a la página de detalles del producto
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetallesProducto(producto: producto),
                  ),
                );
              },
            ),
          );
        },
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

class DetallesProducto extends StatelessWidget {
  final Map<String, dynamic> producto;

  const DetallesProducto({required this.producto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(producto['nombre']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                producto['imagen'],
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              producto['nombre'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              producto['precio'],
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 16),
            Text(
              'Descripción:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(producto['descripcion']),
            SizedBox(height: 16),
            Text(
              'Detalles:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(producto['detalles']),
          ],
        ),
      ),
    );
  }
}
