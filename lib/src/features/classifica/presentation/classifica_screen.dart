import 'package:flutter/material.dart';

class ClassificaScreen extends StatefulWidget {
  const ClassificaScreen({ super.key });

  @override
  State<ClassificaScreen> createState() => _ClassificaScreenState();
}

class _ClassificaScreenState extends State<ClassificaScreen> {
  @override
  Widget build(BuildContext cotext) {
    return const Center(
      child: Text("Classifica"),
    );
  }
}