import 'package:flutter/material.dart';

class CustomConversionScreen extends StatefulWidget {
  @override
  _CustomConversionScreenState createState() => _CustomConversionScreenState();
}

class _CustomConversionScreenState extends State<CustomConversionScreen> {
  double _inputValue = 0.0;
  String _selectedConversion = "Kilogramos a Libras";
  double _result = 0.0;

  void _convert() {
    setState(() {
      if (_selectedConversion == "Kilogramos a Libras") {
        _result = _inputValue * 2.20462;
      } else if (_selectedConversion == "Libras a Kilogramos") {
        _result = _inputValue / 2.20462;
      } else if (_selectedConversion == "Metros a Pies") {
        _result = _inputValue * 3.28084;
      } else if (_selectedConversion == "Pies a Metros") {
        _result = _inputValue / 3.28084;
      } else if (_selectedConversion == "Litros a Galones") {
        _result = _inputValue * 0.264172;
      } else if (_selectedConversion == "Galones a Litros") {
        _result = _inputValue / 0.264172;
      } else if (_selectedConversion == "Celsius a Fahrenheit") {
        _result = (_inputValue * 9 / 5) + 32;
      } else if (_selectedConversion == "Fahrenheit a Celsius") {
        _result = (_inputValue - 32) * 5 / 9;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Ingrese el valor",
              labelStyle: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
              filled: true,
              fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              border: Theme.of(context).inputDecorationTheme.border,
              focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
            ),
            keyboardType: TextInputType.number,
            style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
            onChanged: (value) {
              _inputValue = double.tryParse(value) ?? 0.0;
            },
          ),
          SizedBox(height: 16),
          DropdownButton<String>(
            value: _selectedConversion,
            dropdownColor: Theme.of(context).scaffoldBackgroundColor,
            items: [
              DropdownMenuItem(value: "Kilogramos a Libras", child: Text("Kilogramos a Libras")),
              DropdownMenuItem(value: "Libras a Kilogramos", child: Text("Libras a Kilogramos")),
              DropdownMenuItem(value: "Metros a Pies", child: Text("Metros a Pies")),
              DropdownMenuItem(value: "Pies a Metros", child: Text("Pies a Metros")),
              DropdownMenuItem(value: "Litros a Galones", child: Text("Litros a Galones")),
              DropdownMenuItem(value: "Galones a Litros", child: Text("Galones a Litros")),
              DropdownMenuItem(value: "Celsius a Fahrenheit", child: Text("Celsius a Fahrenheit")),
              DropdownMenuItem(value: "Fahrenheit a Celsius", child: Text("Fahrenheit a Celsius")),
            ],
            onChanged: (value) {
              setState(() {
                _selectedConversion = value!;
              });
            },
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _convert,
            child: Text("Convertir"),
          ),
          SizedBox(height: 16),
          Text(
            "Resultado: $_result",
            style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
          ),
        ],
      ),
    );
  }
}