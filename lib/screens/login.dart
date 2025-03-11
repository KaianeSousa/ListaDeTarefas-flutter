import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'contadorPersistente.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';

  @override
  void initState() {
    super.initState();
    _carregarLogin();
  }

  _carregarLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? '';
      _email = prefs.getString('email') ?? '';
    });
  }

  _guardarLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _name);
    await prefs.setString('email', _email);
  }

  _enviarFormularioLogin() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _guardarLogin();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ContadorPersistente()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                initialValue: _name,
                onSaved: (value) => _name = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail'),
                initialValue: _email,
                onSaved: (value) => _email = value ?? '',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _enviarFormularioLogin,
                child: Text("Entrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}