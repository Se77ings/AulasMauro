// Insere Aluno no banco
import 'package:flutter/material.dart';
import 'package:flutter_application_1/aluno.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Ajuda {
  late Future<Database> banco;

  Ajuda() {
    banco = inicia();
  }

  Future<Database> inicia() async {
    WidgetsFlutterBinding.ensureInitialized();

    final banco = openDatabase(
      join(await getDatabasesPath(), 'escola.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE alunos(id INTEGER PRIMARY KEY, nome TEXT, nota REAL)',
        );
      },
      version: 1,
    );
    return banco;
  }

  Future<void> insereAluno(Aluno aluno) async {
    final bd = await banco;

    await bd.insert(
      'alunos',
      aluno.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> atualizaAluno(Aluno aluno) async {
    final bd = await banco;

    await bd.update(
      'alunos',
      aluno.toMap(),
      where: 'id = ?',
      whereArgs: [aluno.id],
    );
  }

  Future<void> apagaAluno(int id) async {
    final bd = await banco;

    await bd.delete(
      'alunos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

// Retorna todos os alunos
  Future<List<Aluno>> alunos() async {
    final bd = await banco;

    final List<Map<String, Object?>> alunoMaps = await bd.query('alunos');

    return [
      for (final {
            'id': id as int,
            'nome': nome as String,
            'nota': nota as double,
          } in alunoMaps)
        Aluno(id: id, nome: nome, nota: nota),
    ];
  }

  Future<int> quantidade() async {
    final bd = await banco;

    final List<Map<String, Object?>> alunoMaps = await bd.query('alunos');

    return alunoMaps.length;
  }
}
