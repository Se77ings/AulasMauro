import 'package:flutter/material.dart';

class Lista extends StatelessWidget {
  List<String> dias = [
    'domingo',
    'segunda',
    'terça',
    'quarta',
    'quinta',
    'sexta',
    'sábado'
  ];
  final List<int> colorCodes = <int>[900, 600, 500, 400, 300, 200, 100, 800];

  Lista({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: dias.length,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blue[colorCodes[index]],
          height: 130,
          width: 150,
          child: Row(
            children: [
              SizedBox(width: 150, child: Center(child: Text(dias[index]))),
            ],
          ),
        );
      },
    );
  }
}
