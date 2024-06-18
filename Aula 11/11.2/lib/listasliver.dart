import 'package:flutter/material.dart';

class ListaSliver extends StatelessWidget {
  List<String> dias = [
    'domingo',
    'segunda',
    'terça',
    'quarta',
    'quinta',
    'sexta',
    'sábado'
  ];

  ListaSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate:
          SliverChildBuilderDelegate(childCount: dias.length, (context, index) {
        return ListTile(
          title: Container(height: 100, child: Text(dias[index])),
        );
      }),
    );
  }
}
