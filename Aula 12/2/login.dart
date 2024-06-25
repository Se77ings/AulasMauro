import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final String _usuario = 'fulano';
  final String _senha = '123456';

  String? _textoErroUsuario;

  final TextEditingController _controlaCampoUsuario = TextEditingController();
  final TextEditingController _controlaCampoSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO(maurojh): 2. leading
        leading: null,
        automaticallyImplyLeading: false,
        title: const Text('Login'),
      ),
      // TODO(maurojh): 6. row com mainAxisAlignment
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              // TODO(maurojh): 5. ajustar alinhamento cruzado para end
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  child: TextField(
                    controller: _controlaCampoUsuario,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'usuário',
                      errorText: _textoErroUsuario,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  child: TextField(
                    obscureText: true,
                    // TODO(maurojh): 4. esconder a senha digitada
                    controller: _controlaCampoSenha,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'senha',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: onPressed,
                  child: const Text('Entrar'),
                ),
              ]),
        ],
      ),
    );
  }

  void onPressed() {
    // verificar usuario
    if (_usuario == _controlaCampoUsuario.text) {
      // verificar senha
      if (_senha == _controlaCampoSenha.text) {
        // Ir para home
        Navigator.of(context).pushReplacementNamed('/inicio');
      } else {
        limpar();
      }
    } else {
      // Usuário errou nome
      setState(() {
        _textoErroUsuario = 'Usuário não encontrado!';
      });

      limpar();
    }
  }

  void limpar() {
    _controlaCampoSenha.text = '';
    _controlaCampoUsuario.text = '';
  }

  // TODO(maurojh): 3. limpar
}
