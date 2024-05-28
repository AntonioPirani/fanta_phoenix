import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

// TODO Da spostare questo file dentro /src (ci ho provato ma dopo non compila)
// valutare se usare file .ico per le icone o lasciare .png
// TODO aggiungere /assets al file pubspec.yaml !!