import 'package:flutter/material.dart';

// import 'package:fanta_phoenix/src/utils/style.dart';

class MottoText extends StatelessWidget {
  const MottoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '\n"Go Plog, live long"',
              style: TextStyle(
                color: Colors.blueGrey[700],
                //color: Color(0xFF04223D),
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]
        ),
      ),
    );
  }
}