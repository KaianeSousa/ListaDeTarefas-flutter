import 'package:flutter/material.dart';
import 'screens/formulario.dart';
import 'screens/listaDeTarefas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ), //ThemeData
      home: const ListaTarefas(),
      routes: {
        '/listaTarefas': (context) => const ListaTarefas(),
        '/form': (context) => const Formulario(),
      },
    ); //MaterialApp
  }
}