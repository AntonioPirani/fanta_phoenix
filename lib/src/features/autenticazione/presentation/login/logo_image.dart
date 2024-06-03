import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.4,
      child: Image.asset(
        'assets/images/icons/logo.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
