import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen())),  // ! anche qui passare il metodo dal costruttore
      onTap: null,
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