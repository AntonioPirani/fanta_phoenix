import 'package:flutter/material.dart';

import 'package:fanta_phoenix/src/utils/style.dart';

class PasswordDimenticataButton extends StatelessWidget {
  const PasswordDimenticataButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: const TextButton(
        // onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordScreen())),   // ! il metodo onPressed non va definito qui, ma deve essere definito nella pagina di login e passato dal costruttore!
        onPressed: null,
        // padding: const EdgeInsets.only(right: 0.0),
        child: Text(
          'Password dimenticata?',
          style: kLabelStyle,
        ),
      ),
    );
  }
}