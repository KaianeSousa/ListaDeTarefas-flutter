import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;

  @override
  void initState(){
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Com Persistência")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Contador: $_counter", style: TextStyle(fontSize: 24)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _incrementCounter,
                child: Text("Incrementar"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _resetCounter,
                child: Text("Resertar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
