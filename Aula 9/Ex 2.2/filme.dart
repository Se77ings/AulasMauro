class Filme {
  String nome;
  bool curtido;

  Filme (this.nome, this.curtido);

  void muda()
  {
    curtido = !curtido;
  }
}