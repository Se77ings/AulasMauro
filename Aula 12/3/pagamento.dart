import 'package:flutter/material.dart';

class Pagamento extends StatefulWidget {
  const Pagamento({super.key});

  @override
  State<Pagamento> createState() => _PagamentoState();
}

class _PagamentoState extends State<Pagamento> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Método:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownMenu<int>(
            initialSelection: 1,
            onSelected: (int? valor) {
              final snackBar = SnackBar(
                content: Text('Opção escolhida: ${valor}!'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );

              // Find the ScaffoldMessenger in the widget tree
              // and use it to show a SnackBar.
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            dropdownMenuEntries: const [
              DropdownMenuEntry(label: 'Cartão de crédito', value: 1),
              DropdownMenuEntry(label: 'PIX', value: 2),
              DropdownMenuEntry(label: 'Dinheiro', value: 3),
            ])
      ],
    );
  }
}
