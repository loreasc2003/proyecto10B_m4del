import 'package:flutter/material.dart';
import 'dart:async';

class GymHomePage extends StatefulWidget {
  @override
  _GymHomePageState createState() => _GymHomePageState();
}

class _GymHomePageState extends State<GymHomePage> {
  late PageController _pageController; // Controlador del carrusel
  int _currentPage = 0; // Página actual del carrusel
  late Timer _carouselTimer; // Temporizador para el carrusel automático

  // Lista de imágenes para el carrusel
  final List<String> _carouselImages = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // Configurar temporizador para el deslizamiento automático
    _carouselTimer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_pageController.hasClients) {
        setState(() {
          _currentPage = (_currentPage + 1) % _carouselImages.length;
        });
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose(); // Libera recursos del controlador
    _carouselTimer.cancel(); // Cancela el temporizador al salir
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 212, 212), // Sobrescribir el color de AppBar en una vista específica
      appBar: AppBar(
        title: const Text('Gym Bull´s'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Usa el contexto del Builder
            },
          ),
        ),
      ),
      drawer: GymDrawer(), // Menú lateral con navegación a las pantallas
      body: Column(
        children: [
          SizedBox(height: 16),
          // Carrusel de imágenes con margen y navegación manual
          Container(
            margin: const EdgeInsets.all(16.0), // Margen alrededor del carrusel
            height: 200, // Altura del carrusel
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: _carouselImages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12), // Esquinas redondeadas
                      child: Image.asset(
                        _carouselImages[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
                Positioned(
                  left: 10,
                  top: 80,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      if (_currentPage > 0) {
                        setState(() {
                          _currentPage--;
                        });
                        _pageController.animateToPage(
                          _currentPage,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 80,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                    onPressed: () {
                      if (_currentPage < _carouselImages.length - 1) {
                        setState(() {
                          _currentPage++;
                        });
                        _pageController.animateToPage(
                          _currentPage,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          // Indicadores del carrusel
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _carouselImages.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _pageController.animateToPage(
                  entry.key,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                ),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == entry.key
                        ? Colors.white
                        : Colors.grey,
                  ),
                ),
              );
            }).toList(),
          ),
          // Sección de opciones debajo del carrusel
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,  // Habilita el desplazamiento horizontal
              child: Row(
                children: [
                  OptionCard(
                    icon: Icons.local_offer,
                    label: 'Ofertas',
                    color: const Color.fromARGB(255, 81, 76, 30),  // Color específico para Ofertas
                    onTap: () {
                      Navigator.pushNamed(context, '/promotions');
                    },
                  ),
                  SizedBox(width: 16), // Espacio entre los elementos
                  OptionCard(
                    icon: Icons.production_quantity_limits,
                    label: 'Productos',
                    color: const Color.fromARGB(255, 81, 76, 30), // Color específico para Productos
                    onTap: () {
                      Navigator.pushNamed(context, '/products');
                    },
                  ),
                  SizedBox(width: 16), // Espacio entre los elementos
                  OptionCard(
                    icon: Icons.visibility,
                    label: 'Más Visto',
                    color: const Color.fromARGB(255, 81, 76, 30), // Color específico para Lo Más Visto
                    onTap: () {
                      Navigator.pushNamed(context, '/most_viewed');
                    },
                  ),
                  SizedBox(width: 16),
                  OptionCard(
                    icon: Icons.favorite,
                    label: 'Favoritos',
                    color: const Color.fromARGB(255, 81, 76, 30), // Color específico para Favoritos
                    onTap: () {
                      Navigator.pushNamed(context, '/favorites');
                    },
                  ),
                  SizedBox(width: 16), // Espacio entre los elementos
                  OptionCard(
                    icon: Icons.shopping_cart,
                    label: 'Carrito',
                    color: const Color.fromARGB(255, 81, 76, 30), // Color específico para Carrito
                    onTap: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color color; // Color personalizado para cada opción

  const OptionCard({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.color, // Recibe el color como parámetro
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,  // Ancho fijo para todos los fondos
        height: 120, // Alto fijo para todos los fondos
        padding: EdgeInsets.all(12), // Espaciado dentro del contenedor
        decoration: BoxDecoration(
          color: color.withOpacity(0.05), // Fondo tenue con opacidad 0.05
          borderRadius: BorderRadius.circular(12), // Esquinas redondeadas
          border: Border.all(
            color: color, // Color del borde
            width: 2, // Grosor del borde
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.1), // Sombra tenue
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50, // Aumentar el tamaño del ícono
              color: color, // Usar el color personalizado
            ),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: color),
            ),
          ],
        ),
      ),
    );
  }
}

class GymDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 214, 212, 212), // Aquí puedes agregar el color que desees
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Pedidos'),
            onTap: () {
              Navigator.pushNamed(context, '/orders');
            },
          ),
          ListTile(
            leading: const Icon(Icons.details),
            title: const Text('Detalles pedidos'),
            onTap: () {
              Navigator.pushNamed(context, '/order_details');
            },
          ),
          ListTile(
            leading: const Icon(Icons.production_quantity_limits),
            title: const Text('Productos'),
            onTap: () {
              Navigator.pushNamed(context, '/products');
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Detalles productos'),
            onTap: () {
              Navigator.pushNamed(context, '/product_details');
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_offer),
            title: const Text('Promociones'),
            onTap: () {
              Navigator.pushNamed(context, '/promotions');
            },
          ),
          ListTile(
            leading: const Icon(Icons.details),
            title: const Text('Detalles promociones'),
            onTap: () {
              Navigator.pushNamed(context, '/promotion_details');
            },
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Inicia sesión'),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
