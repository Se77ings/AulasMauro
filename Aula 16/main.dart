import 'package:flutter/material.dart';
import 'package:flutter_application_1/ajuda.dart';
import 'package:flutter_application_1/aluno.dart';

void main() async {
  // TODO 1: Retire os dois comentários abaixo e teste
  Aluno teste1 = Aluno(id: 0, nome: 'Fulano', nota: 6.3);
  print(teste1);

  // TODO 2: Retire o comentario das linhas 11 a 19
  var aluno1 = Aluno(
    id: 0,
    nome: 'Fulano de tal',
    nota: 5.6,
  );

  Ajuda helper = Ajuda();
  await helper.insereAluno(aluno1);
  print(await helper.alunos());

  // TODO 4: retire o comentário das próximas 7 linhas
  aluno1 = Aluno(
    id: 0,
    nome: 'Fulano de tal',
    nota: 8.5,
  );
  await helper.atualizaAluno(aluno1);
  // print(await helper.alunos());

  // TODO 3: Adicione um aluno e mostre a lista de todos
  var aluno2 = Aluno(
    id: 1,
    nome: 'Cicrano de Tal',
    nota: 10,
  );

  await helper.insereAluno(aluno2);

  // print(await helper.alunos());

  // TODO 5: retire o comentário das próximas 2 linhas
  await helper.apagaAluno(0);
  print(await helper.alunos());

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Trabalhando com banco de dados SQLite'),
        ),
      ),
    );
  }
}
