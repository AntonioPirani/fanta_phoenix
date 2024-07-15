import 'package:flutter/material.dart';

class RegolamentoScreen extends StatefulWidget {
  const RegolamentoScreen({super.key});

  @override
  State<RegolamentoScreen> createState() => _RegolamentoScreenState();
}

class _RegolamentoScreenState extends State<RegolamentoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Regolamento"),
      ),
      body: const Center(
        child: Text("Questo è il Regolamento"),
      ),
    );
  }
}