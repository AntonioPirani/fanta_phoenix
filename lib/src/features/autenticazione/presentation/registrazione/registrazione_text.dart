import 'package:flutter/material.dart';

class RegistrazioneText extends StatelessWidget {
  const RegistrazioneText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Registrazione',
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'OpenSans',
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}