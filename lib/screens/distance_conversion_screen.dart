import 'package:flutter/material.dart';

class DistanceConversionScreen extends StatefulWidget {
  @override
  _DistanceConversionScreenState createState() => _DistanceConversionScreenState();
}

class _DistanceConversionScreenState extends State<DistanceConversionScreen> {
  double _inputValue = 0.0;
  String _selectedConversion = "Años luz a Unidad Astronomica";
  double _result = 0.0;

  void _convert() {
    setState(() {
      if (_selectedConversion == "Años luz a Unidad Astronomica") {
        _result = _inputValue * 63241.1;
      } else {
        _result = _inputValue / 63241.1;
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
            decoration: InputDecoration(labelText: "Ingrese el valor"),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              _inputValue = double.tryParse(value) ?? 0.0;
            },
          ),
          DropdownButton<String>(
            value: _selectedConversion,
            items: [
              DropdownMenuItem(value: "Años luz a Unidad Astronomica", child: Text("Años luz a Unidad Astronomica")),
              DropdownMenuItem(value: "Unidad Astronomica a Años luz", child: Text("Unidad Astronomica a Años luz")),
            ],
            onChanged: (value) {
              setState(() {
                _selectedConversion = value!;
              });
            },
          ),
          ElevatedButton(
            onPressed: _convert,
            child: Text("Convertir"),
          ),
          Text("Resultado: $_result"),
        ],
      ),
    );
  }
}
