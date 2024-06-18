import 'package:flutter/material.dart';
import 'package:flutter_aula11_4/itens.dart';

class Grade extends StatelessWidget {
  const Grade({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grade com Scaffold'),
      ),
      body: GridView.builder(
        itemCount: 2,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 50,
              width: 50,
              color: Colors.blue,
              child: Center(child: Text(Itens.letras[index])),
            ),
          );
        },
      ),
    );
  }
}
