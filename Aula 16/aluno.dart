class Aluno {
  final int id;
  final String nome;
  final double nota;

  Aluno({
    required this.id,
    required this.nome,
    required this.nota,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'nome': nome,
      'nota': nota,
    };
  }

  @override
  String toString() {
    return 'Aluno{id: $id, nome: $nome, nota: $nota}';
  }
}