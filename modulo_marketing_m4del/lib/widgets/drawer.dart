import 'package:flutter/material.dart';
import '../screens/productos.dart';
import '../screens/promociones.dart';
import '../screens/pedidos.dart';
import '../screens/login.dart';

class GymDrawer extends StatelessWidget {
  final bool isLoggedIn;
  final String userEmail;
  final Function onLogout; // Callback para manejar el cierre de sesión

  // Constructor para recibir el estado de login y correo del usuario
  GymDrawer({required this.isLoggedIn, required this.userEmail, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Inicio',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  isLoggedIn ? userEmail : 'Inicia sesión para continuar', // Muestra el email o mensaje de login
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Productos'),
            onTap: () {
              Navigator.pop(context); // Cierra el Drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Productos()), // Navega a Productos
              );
            },
          ),
          // Si el usuario ha iniciado sesión, mostramos las opciones adicionales
          if (isLoggedIn) ...[
            ListTile(
              leading: Icon(Icons.local_offer),
              title: Text('Promociones'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Promociones()), // Navega a Promociones
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Pedidos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pedidos()), // Navega a Pedidos
                );
              },
            ),
          ],
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Salir'),
            onTap: () {
              Navigator.pop(context); // Cierra el Drawer
              onLogout(); // Llama al callback para cerrar sesión
            },
          ),
        ],
      ),
    );
  }
}
