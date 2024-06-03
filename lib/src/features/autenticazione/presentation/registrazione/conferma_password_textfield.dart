import 'package:flutter/material.dart';

import 'package:fanta_phoenix/src/utils/style.dart';

class ConfermaPasswordTextfield extends StatelessWidget {
  const ConfermaPasswordTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Conferma Password',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: const TextField(
            //controller: _controllerConferma,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.vpn_key,
                color: Colors.white,
              ),
              hintText: 'Conferma la tua Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}