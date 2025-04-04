import 'package:flutter/material.dart';
import 'temperature_conversion_screen.dart';
import 'distance_conversion_screen.dart';
import 'custom_conversion_screen.dart'; // Ensure this file exists and is correctly imported

class HomeScreen extends StatefulWidget {
  final VoidCallback toggleTheme;

  HomeScreen({required this.toggleTheme});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    TemperatureConversionScreen(),
    DistanceConversionScreen(),
    CustomConversionScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pop(context); // Cierra el drawer al seleccionar
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor de Unidades"),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: widget.toggleTheme, // Alterna entre claro y oscuro
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor, // Fondo del Drawer
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary, // Fondo del encabezado
                ),
                child: Text(
                  "Menú",
                  style: TextStyle(
                    color: Colors.white, // Texto blanco para contraste
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.thermostat, color: Theme.of(context).colorScheme.secondary),
                title: Text(
                  "Celsius ↔ Rankine",
                  style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
                ),
                onTap: () => _onItemTapped(0),
              ),
              ListTile(
                leading: Icon(Icons.space_bar, color: Theme.of(context).colorScheme.secondary),
                title: Text(
                  "Años luz ↔ UA",
                  style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
                ),
                onTap: () => _onItemTapped(1),
              ),
              ListTile(
                leading: Icon(Icons.fitness_center, color: Theme.of(context).colorScheme.secondary),
                title: Text(
                  "Otras Unidades",
                  style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
                ),
                onTap: () => _onItemTapped(2),
              ),
            ],
          ),
        ),
      ),
      body: _screens[_selectedIndex],
    );
  }
}
