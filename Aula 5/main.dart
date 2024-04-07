/*
Mostre Aprovado se a média for maior ou igual a 6.0.
Permita que o usuário limpe os campos usando o botão Limpar no Snackbar.
Mostre um SnackBar dizendo: "Preencha os campos!" quando o usuário tentar apertar o botão Calcular sem preencher algum dado.
*/
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Média',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculadoraMediaPage(),
    );
  }
}

class CalculadoraMediaPage extends StatefulWidget {
  @override
  _CalculadoraMediaPageState createState() => _CalculadoraMediaPageState();
}

class _CalculadoraMediaPageState extends State<CalculadoraMediaPage> {
  final TextEditingController _nota1Controller = TextEditingController();
  final TextEditingController _nota2Controller = TextEditingController();
  final TextEditingController _nota3Controller = TextEditingController();
  final TextEditingController _nota4Controller = TextEditingController();

  double? _media;

  void _calcularMedia() {
    if (_nota1Controller.text.isEmpty ||
        _nota2Controller.text.isEmpty ||
        _nota3Controller.text.isEmpty ||
        _nota4Controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Preencha todos os campos!'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    double nota1 = double.tryParse(_nota1Controller.text) ?? 0.0;
    double nota2 = double.tryParse(_nota2Controller.text) ?? 0.0;
    double nota3 = double.tryParse(_nota3Controller.text) ?? 0.0;
    double nota4 = double.tryParse(_nota4Controller.text) ?? 0.0;

    setState(() {
      _media = (nota1 + nota2 + nota3 + nota4) / 4;
    });

    String mensagem;
    if (_media! >= 6.0) {
      mensagem = 'Aprovado! Média: ${_media!.toStringAsFixed(2)}';
    } else {
      mensagem = 'Reprovado! Média: ${_media!.toStringAsFixed(2)}';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        action: SnackBarAction(
          label: 'Limpar',
          onPressed: () {
            _limparCampos();
          },
        ),
      ),
    );
  }

  void _limparCampos() {
    _nota1Controller.clear();
    _nota2Controller.clear();
    _nota3Controller.clear();
    _nota4Controller.clear();
    setState(() {
      _media = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Média'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nota1Controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Nota 1'),
            ),
            TextField(
              controller: _nota2Controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Nota 2'),
            ),
            TextField(
              controller: _nota3Controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Nota 3'),
            ),
            TextField(
              controller: _nota4Controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Nota 4'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularMedia,
              child: Text('Calcular Média'),
            ),
            SizedBox(height: 20),
            if (_media != null)
              Text(
                'Média: ${_media!.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20),
              ),
          ],
        ),
      ),
    );
  }
}
