import 'package:flutter/material.dart';

class RecuperaPasswordText extends StatelessWidget {
  const RecuperaPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Recupera Password',
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'OpenSans',
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}