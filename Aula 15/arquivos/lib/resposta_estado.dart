import 'package:flutter/material.dart';
import 'resposta.dart';

class RespostaEstado extends StatefulWidget {
  const RespostaEstado({super.key});

  @override
  State<RespostaEstado> createState() => _RespostaEstadoState();
}

class _RespostaEstadoState extends State<RespostaEstado> {
  int pontos = 0;
  int ultimoValor = 0;
  String resultado = 'Jogue o dado para começar';
  int responseValorDado = 0;
  void jogarDado() {
    setState(() {
      resultado = processarJogada();
    });
  }

  String processarJogada() {
    if (pontos == 10) {
      pontos = 0;
    }
    final valorDado = Resposta().valorDado();
    responseValorDado = valorDado;
    if (valorDado == 5) {
      return 'Tirou 5, repita sem somar pontos';
    } else if (valorDado == 1 || valorDado == 3) {
      pontos = 0;
      return 'Tirou $valorDado, perdeu a vez';
    } else {
      pontos += valorDado;
      if (pontos == 10) {
        return 'Tirou $valorDado, somou 10 pontos e ganhou!';
      } else if (pontos > 10) {
        pontos = 0; // Resetar pontos após perder
        return 'Tirou $valorDado, ultrapassou 10 pontos e perdeu!';
      } else if (valorDado == ultimoValor) {
        return 'Tirou $valorDado novamente, soma os pontos e repete';
      }
      ultimoValor = valorDado;
      return 'Tirou $valorDado, pontos: $pontos';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Pontuação: $pontos",
            textAlign: TextAlign.center,
          ),
          Text(
            resultado,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24),
          ),
          Image.asset(
            "assets/dado$responseValorDado.png",
            width: 200,
            height: 200,
            scale: 4,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: jogarDado,
            child: pontos != 10 ? Text('Jogar Dado') : Text('Recomeçar Jogo'),
          ),
        ],
      ),
    );
  }
}
