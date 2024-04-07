/*
Exercício 1.6:
Crie uma app que recebe 4 notas e o nome de um aluno, calcule a média e mostra a mensagem:
*/
import 'package:flutter/material.dart';

class Pagina2 extends StatefulWidget {
  const Pagina2({super.key});

  @override
  State<Pagina2> createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  final TextEditingController _controlaNome = TextEditingController();

  String _nota1 = "";
  String _nota2 = "";
  String _nota3 = "";
  String _nota4 = "";
  String _resultado = "";
  String _nome = "";

  void _calculaResultado() {
    _nome = _controlaNome.text;
    var nota1 = double.tryParse(_nota1);
    var nota2 = double.tryParse(_nota2);
    var nota3 = double.tryParse(_nota3);
    var nota4 = double.tryParse(_nota4);
    print(nota1);
    setState(() {
      if (nota1 != null && nota2 != null && nota3 != null && nota4 != null) {
        var media = (nota1 + nota2 + nota3 + nota4) / 4;
        _resultado = 'A média do aluno $_nome é: $media';
      } else {
        _resultado = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('resultado final'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text('Nome:'),
              SizedBox(
                  width: 100,
                  child: TextField(
                    controller: _controlaNome,
                    onChanged: null,
                  )),
            ],
          ),
          Row(
            children: [
              Text('Nota 1:'),
              SizedBox(
                  width: 100,
                  child: TextField(onChanged: (String valor) {
                    _nota1 = valor;
                  })),
            ],
          ),
          Row(
            children: [
              Text('Nota 2:'),
              SizedBox(
                  width: 100,
                  child: TextField(onChanged: (String valor) {
                    _nota2 = valor;
                  })),
            ],
          ),
          Row(
            children: [
              Text('Nota 3:'),
              SizedBox(
                  width: 100,
                  child: TextField(onChanged: (String valor) {
                    _nota3 = valor;
                  })),
            ],
          ),
          Row(
            children: [
              Text('Nota 4:'),
              SizedBox(
                  width: 100,
                  child: TextField(onChanged: (String valor) {
                    _nota4 = valor;
                  })),
            ],
          ),
        
          ElevatedButton(
              onPressed: () {
                _calculaResultado();
              },
              child: const Text('Resultado')),
          Row(children: [Text('$_resultado')])
        ],
      ),
    );
  }
}
