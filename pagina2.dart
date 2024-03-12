import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Pagina2 extends StatefulWidget {
  const Pagina2({super.key});

  @override
  State<Pagina2> createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  final TextEditingController _controlaNome = TextEditingController();

  String _notaDigitada = "";
  String _resultado = "";
  String _nome = "";

  void _calculaResultado() {
    _nome = _controlaNome.text;
    var nota = double.tryParse(_notaDigitada);
    print(nota);
    setState(() {
      if (nota != null) {
        if (nota >= 6.0) {
          _resultado = '${_controlaNome.text} foi aprovado';
        } else {
          _resultado = '${_controlaNome.text} foi reprovado!!!!!';
        }
      } else {
        _resultado = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
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
              Text('Nota:'),
              SizedBox(
                  width: 100,
                  child: TextField(onChanged: (String valor) {
                    _notaDigitada = valor;
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
