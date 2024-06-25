import 'package:flutter/material.dart';

class CEP extends StatefulWidget {
  const CEP({super.key});

  @override
  State<CEP> createState() => _CEPState();
}

class _CEPState extends State<CEP> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Text('CEP:'),
            SizedBox(
              width: 150,
              child: TextField(
                decoration: InputDecoration(
                    hintText: '99999-999', border: OutlineInputBorder()),
              ),
            ),
            Text('Rua:'),
            SizedBox(
              width: 150,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Av. conceicao', border: OutlineInputBorder()),
              ),
            ),
            Text('Numero:'),
            SizedBox(
              width: 150,
              child: TextField(
                decoration: InputDecoration(
                    hintText: '150', border: OutlineInputBorder()),
              ),
            ),
            Text('Bairro:'),
            SizedBox(
              width: 150,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Nossa senhora das Graças',
                    border: OutlineInputBorder()),
              ),
            ),
          ],
        )
      ],
    );
  }
}
