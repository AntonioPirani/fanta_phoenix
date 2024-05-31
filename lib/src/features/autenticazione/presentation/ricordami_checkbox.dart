import 'package:flutter/material.dart';

import 'package:fanta_phoenix/src/utils/style.dart';

class RicordamiCheckbox extends StatelessWidget {
  const RicordamiCheckbox({super.key});
  //bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: false,   // ! false è da cambiare con un valore booleano
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                // setState(() {
                //   _rememberMe = value;
                // });

              },
            ),
          ),
          const Text(
            'Ricordami',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }
}