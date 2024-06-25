import 'package:flutter/material.dart';
import 'package:flutter_rotas/inicio.dart';
import 'package:flutter_rotas/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp contains our top-level Navigator
      initialRoute: '/login',
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => const Login(),
        '/inicio': (BuildContext context) => const Inicio(),
      },
    );
  }
}
