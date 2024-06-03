import 'package:flutter/material.dart';

import 'package:fanta_phoenix/src/utils/style.dart';

class PasswordDimenticataButton extends StatelessWidget {
  final Widget passwordScreen;
  const PasswordDimenticataButton({super.key, required this.passwordScreen});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => passwordScreen
          )
        ),
        // padding: const EdgeInsets.only(right: 0.0),
        child: const Text(
          'Password dimenticata?',
          style: kLabelStyle,
        ),
      ),
    );
  }
}