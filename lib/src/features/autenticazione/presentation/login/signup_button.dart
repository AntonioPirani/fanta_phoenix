import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  final Widget registrationScreen;
  const SignupButton({super.key, required this.registrationScreen});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => registrationScreen
        )
      ),  
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: '\nNon hai un account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Registrati',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}