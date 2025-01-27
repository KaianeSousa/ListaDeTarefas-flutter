import 'package:flutter/material.dart';
import 'formulario.dart';

class ListaTarefas extends StatefulWidget {
  const ListaTarefas({super.key});

  @override
  State<ListaTarefas> createState() => _ListaTarefasState();
}

class _ListaTarefasState extends State<ListaTarefas> {
  List<String> tarefas = [];

  void _adicionarTarefa(String tarefa) {
    setState(() {
      tarefas.add(tarefa);
    });
  }

  void _navegarParaFormulario(BuildContext context) async {
    final tarefa = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Formulario(),
      ), //MaterialPageRoute
    );

    if (tarefa != null) {
      _adicionarTarefa(tarefa);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
      ), //AppBar
      body: ListView.builder(
        itemCount: tarefas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tarefas[index]),
          ); //ListTitle
        },
      ), //ListView.builder
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navegarParaFormulario(context),
        child: const Icon(Icons.add),
      ), //FloatingActionButton
    ); //Scaffold
  }
}
