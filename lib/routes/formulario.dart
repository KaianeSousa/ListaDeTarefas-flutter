import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  TextEditingController ControladorNomeTarefa = TextEditingController();
  TextEditingController ControladorDescricao = TextEditingController();
  TextEditingController ControladorHorario = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Tarefa'),
      ), //AppBar
      body: Center(
        child: Container(
          height: 600,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.indigo[400],
            borderRadius: BorderRadius.circular(20),
          ), //BoxDecoration
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: ControladorNomeTarefa,
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return 'Lembre-se de adicionar um nome a sua tarefa';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Nome da Tarefa',
                      fillColor: Colors.deepPurple[200],
                      filled: true,
                    ), //InputDecoration
                  ), //TextFormField
                ), //Padding
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: ControladorDescricao,
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return 'Lembre-se de adicionar uma descrição a sua tarefa';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Descrição',
                      fillColor: Colors.deepPurple[200],
                      filled: true,
                    ), //InputDecoration
                  ), //TextFormField
                ), //Padding
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: ControladorHorario,
                    validator: (value) {
                      if (value!.isEmpty || int.parse(value) > 24 || int.parse(value) < 0) {
                        return 'Horário inválido';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Horário de Início',
                      fillColor: Colors.deepPurple[200],
                      filled: true,
                    ), //InputDecoration
                  ), //TextFormField
                ), //Padding
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      final tarefa = ControladorNomeTarefa.text;
                      if (tarefa.isNotEmpty) {
                        Navigator.pop(context, tarefa);
                      }
                    },
                    child: const Text('Adicionar'),
                  ), //ElevatedButon
                ), //Padding
              ],
            ), //Column
          ), //SingleChildScrollView
        ), //Container
      ), //Center
    ); //Scaffold
  }
}
