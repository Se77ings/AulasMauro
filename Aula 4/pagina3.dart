
/*
Exercício 1.7:
Crie um app que recebe a quantidade e o valor de dois produtos e determina o mais barato:
*/
import 'package:flutter/material.dart';

class Pagina3 extends StatefulWidget {
  const Pagina3({Key? key}) : super(key: key);

  @override
  _Pagina3State createState() => _Pagina3State();
}

class _Pagina3State extends State<Pagina3> {
  final TextEditingController _produtoAQuantidade = TextEditingController();
  final TextEditingController _produtoAPreco = TextEditingController();
  final TextEditingController _produtoBQuantidade = TextEditingController();
  final TextEditingController _produtoBPreco = TextEditingController();

  String _resultado = "";

  void _encontrarMaisBarato() {
    int? quantidadeA = int.tryParse(_produtoAQuantidade.text);
    double? precoA = double.tryParse(_produtoAPreco.text);
    int? quantidadeB = int.tryParse(_produtoBQuantidade.text);
    double? precoB = double.tryParse(_produtoBPreco.text);

    if (quantidadeA != null &&
        precoA != null &&
        quantidadeB != null &&
        precoB != null &&
        quantidadeA > 0 &&
        quantidadeB > 0 &&
        precoA > 0 &&
        precoB > 0) {
      double precoTotalA = quantidadeA * precoA;
      double precoTotalB = quantidadeB * precoB;

      if (precoTotalA < precoTotalB) {
        setState(() {
          _resultado = 'Mais barato: Produto A';
        });
      } else if (precoTotalB < precoTotalA) {
        setState(() {
          _resultado = 'Mais barato: Produto B';
        });
      } else {
        setState(() {
          _resultado = 'Ambos os produtos têm o mesmo preço total.';
        });
      }
    } else {
      setState(() {
        _resultado = 'Por favor, insira valores válidos para quantidade e preço.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparação de Produtos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Produto A'),
            TextField(
              controller: _produtoAQuantidade,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Quantidade'),
            ),
            TextField(
              controller: _produtoAPreco,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Preço por unidade'),
            ),
            SizedBox(height: 20),
            Text('Produto B'),
            TextField(
              controller: _produtoBQuantidade,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Quantidade'),
            ),
            TextField(
              controller: _produtoBPreco,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Preço por unidade'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _encontrarMaisBarato();
              },
              child: Text('Comparar Produtos'),
            ),
            SizedBox(height: 20),
            Text(
              _resultado,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
