import 'package:flutter/material.dart';
import './screens/home.dart';
import './screens/login.dart';
import 'screens/register.dart';
import 'screens/products.dart';
import 'screens/product_details.dart';
import 'screens/orders.dart';
import 'screens/order_details.dart';
import 'screens/promotions.dart';
import 'screens/promotion_details.dart';
import '../theme.dart'; // Importar el tema

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: appTheme, // Aplicar el tema a toda la aplicación
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => GymHomePage(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/products': (context) => Products(),
        '/product_details': (context) => ProductDetails(),
        '/orders': (context) => Orders(),
        '/order_details': (context) => OrderDetails(),
        '/promotions': (context) => Promotions(),
        '/promotion_details': (context) => PromotionDetails(),
      
        // Define aquí las demás rutas de tu aplicación
      },
    );
  }
}
