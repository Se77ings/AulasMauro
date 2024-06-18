class Lista {
  List<String> _itens = [];

  Lista() {
    novo();
  }

  List<String> getItens() {
    return _itens;
  }

  String getElemento(int pos) {
    return _itens[pos];
  }

  void remover(int posicao) {
    _itens.removeAt((posicao));
  }

  void novo() {
    DateTime agora = DateTime.now();
    String tempo = '${agora.hour}:${agora.minute}:${agora.second}';
    _itens.add(tempo);
  }
}
