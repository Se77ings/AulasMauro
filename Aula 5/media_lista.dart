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

class Aluno {
  String nome;
  double media;

  Aluno({required this.nome, required this.media});
}

class CalculadoraMediaPage extends StatefulWidget {
  @override
  _CalculadoraMediaPageState createState() => _CalculadoraMediaPageState();
}

class _CalculadoraMediaPageState extends State<CalculadoraMediaPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _nota1Controller = TextEditingController();
  final TextEditingController _nota2Controller = TextEditingController();
  final TextEditingController _nota3Controller = TextEditingController();
  final TextEditingController _nota4Controller = TextEditingController();

  List<Aluno> _alunos = [];

  void _calcularMedia() {
    String nome = _nomeController.text;
    if (nome.isEmpty ||
        _nota1Controller.text.isEmpty ||
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

    double media = (nota1 + nota2 + nota3 + nota4) / 4;

    setState(() {
      _alunos.add(Aluno(nome: nome, media: media));
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Média calculada para $nome: ${media.toStringAsFixed(2)}'),
        duration: Duration(seconds: 2),
      ),
    );

    _limparCampos();
  }

  void _limparCampos() {
    _nomeController.clear();
    _nota1Controller.clear();
    _nota2Controller.clear();
    _nota3Controller.clear();
    _nota4Controller.clear();
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
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome do Aluno'),
            ),
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
            Text(
              'Lista de Alunos:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _alunos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${_alunos[index].nome}'),
                    subtitle: Text('Média: ${_alunos[index].media.toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
