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
      ), // MaterialPageRoute
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
      ), // AppBar
      body: ListView.builder(
        itemCount: tarefas.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.deepPurple[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(
                tarefas[index],
                style: const TextStyle(color: Colors.white),
              ),
            ), // ListTile
          ); // Container
        },
      ), // ListView.builder
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navegarParaFormulario(context),
        child: const Icon(Icons.add),
      ), // FloatingActionButton
    ); // Scaffold
  }
}
