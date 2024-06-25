import 'package:flutter/material.dart';
import 'package:flutter_pagina/mes.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final List<String> meses = ['Jan', 'Fev', 'Mar', 'Abr', 'Mai'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Lista de Meses'),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: meses.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(meses[index]),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Mes(meses[index]),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Text(meses[0]),
              ],
            ));
      }),
    );
  }
}
