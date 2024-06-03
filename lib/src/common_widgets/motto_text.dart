import 'package:flutter/material.dart';

class MottoText extends StatelessWidget {
  const MottoText({super.key});

  @override
  Widget build(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Sviluppato dal ',
                style: TextStyle(
                  color: Colors.blueGrey[700],
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'PlogOn',
                style: TextStyle(
                  color: Colors.blueGrey[700],
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              TextSpan(
                text: ' team',
                style: TextStyle(
                  color: Colors.blueGrey[700],
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8.0),
        Image.asset(
          'assets/images/icons/plogon.png',
          width: 20,
          height: 20,
        ),
      ],
    ),
  );
}

}