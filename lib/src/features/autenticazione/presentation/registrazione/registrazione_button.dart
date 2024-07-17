import 'package:flutter/material.dart';

class RegistrazioneButton extends StatelessWidget {
  const RegistrazioneButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 35.0),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context); 
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                return Colors.white;
              }),
              padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.all(15.0),
              ),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              elevation: WidgetStateProperty.all<double>(5.0),
              minimumSize: WidgetStateProperty.all<Size>(const Size(150, 50)),
            ),
            child: const Text(
              'Registrati',
              style: TextStyle(
                color: Color(0xFF527DAA),
                letterSpacing: 1.5,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
          )
        ),  
      ],
    );
  }
}