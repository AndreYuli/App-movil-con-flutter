import 'package:flutter/material.dart';

class TemperatureConversionScreen extends StatefulWidget {
  @override
  _TemperatureConversionScreenState createState() => _TemperatureConversionScreenState();
}

class _TemperatureConversionScreenState extends State<TemperatureConversionScreen> {
  double _inputValue = 0.0;
  String _selectedConversion = "Celsius a Rankine";
  double _result = 0.0;

  void _convert() {
    setState(() {
      if (_selectedConversion == "Celsius a Rankine") {
        _result = (_inputValue * 9/5) + 491.67;
      } else {
        _result = (_inputValue - 491.67) * 5/9;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Cuadro de texto para ingresar el valor
          TextField(
            decoration: InputDecoration(
              labelText: "Ingrese el valor",
              labelStyle: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color), // Color del label
              filled: true,
              fillColor: Theme.of(context).inputDecorationTheme.fillColor, // Fondo del cuadro
              border: Theme.of(context).inputDecorationTheme.border, // Borde del cuadro
              focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder, // Borde al enfocar
            ),
            keyboardType: TextInputType.number,
            style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color), // Color del texto ingresado
            onChanged: (value) {
              _inputValue = double.tryParse(value) ?? 0.0;
            },
          ),
          SizedBox(height: 16),

          // DropdownButton para seleccionar la conversión
          DropdownButton<String>(
            value: _selectedConversion,
            dropdownColor: Theme.of(context).scaffoldBackgroundColor, // Fondo del menú desplegable
            items: [
              DropdownMenuItem(
                value: "Celsius a Rankine",
                child: Text(
                  "Celsius a Rankine",
                  style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color), // Color del texto
                ),
              ),
              DropdownMenuItem(
                value: "Rankine a Celsius",
                child: Text(
                  "Rankine a Celsius",
                  style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color), // Color del texto
                ),
              ),
            ],
            onChanged: (value) {
              setState(() {
                _selectedConversion = value!;
              });
            },
          ),
          SizedBox(height: 16),

          // Botón para convertir
          ElevatedButton(
            onPressed: _convert,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary, // Fondo rojo
              foregroundColor: Theme.of(context).colorScheme.onPrimary, // Texto blanco
            ),
            child: Text("Convertir"),
          ),
          SizedBox(height: 16),

          // Texto del resultado
          Text(
            "Resultado: $_result",
            style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color), // Color del texto
          ),
        ],
      ),
    );
  }
}
