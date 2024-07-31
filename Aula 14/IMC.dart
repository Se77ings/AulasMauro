import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:imc/jsonData.dart';

class IMC extends StatefulWidget {
  const IMC({super.key});

  @override
  State<IMC> createState() => _IMCState();
}

class _IMCState extends State<IMC> {
  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();

  String resposta = "";
  jsonData respostaObj = jsonData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Vetores',
        home: Scaffold(
            body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 400,
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: peso,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Insira o Peso',
                  ),
                ),
              ),
              Container(
                width: 400,
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: altura,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Insira a altura',
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    apiRequest(peso.text, altura.text);
                  },
                  child: const Text('Verificar IMC'),
                ),
              ),
              Container(
                  child: Text(
                      "Resposta obtida: ${respostaObj.imc != null ? respostaObj.imc : "null"}"))
            ],
          ),
        )));
  }

  Future<String> apiRequest(String peso, String altura) async {
    final response = await (http.get(Uri.parse(
        'https://0efdfa50-1fa5-4921-8826-8b1cb952554a-00-3ljzlwuba4h73.janeway.replit.dev/?peso=$peso&altura=$altura')));
    if (response.statusCode == 200) {
      print('response statusCode is 200');
      setState(() {
        resposta = response.body;
        respostaObj = jsonData.fromJson(jsonDecode(resposta));
      });
      return response.body;
    } else {
      print('Http Error: ${response.statusCode}!');
      throw Exception('Invalid data source.');
    }

    // return print("Recebi $peso e $altura");
  }
}
