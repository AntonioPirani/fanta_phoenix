import 'package:flutter/material.dart';

// import 'package:fanta_phoenix/src/utils/style.dart';

class TitoloText extends StatelessWidget {
  const TitoloText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'FANTA PHOENIX',
              style: TextStyle(
                color: Colors.deepOrange[700],
                //color: Color(0xFF04223D),
                fontSize: 38.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]
        ),
      ),
    );
  }
}