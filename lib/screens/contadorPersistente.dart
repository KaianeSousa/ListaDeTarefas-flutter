import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart'; // Importe a tela de login para usar no logout

class ContadorPersistente extends StatefulWidget {
  @override
  _ContadorPersistenteState createState() => _ContadorPersistenteState();
}

class _ContadorPersistenteState extends State<ContadorPersistente> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter++;
    });
    await prefs.setInt('counter', _counter);
  }

  _resetCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = 0;
    });
    await prefs.setInt('counter', _counter);
  }

  _sairDaConta() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('name');
    await prefs.remove('email');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Com Persistência"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Contador: $_counter", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text("Incrementar"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan[50],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetCounter,
              child: Text("Resetar"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[50],
                textStyle: TextStyle(
                  color: Colors.red[50],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sairDaConta,
              child: Text("Sair da Conta"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[200],
              ),
            ),
          ],
        ),
      ),
    );
  }
}