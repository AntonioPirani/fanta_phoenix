import 'package:flutter/material.dart';

class IndietroButton extends StatelessWidget {
  const IndietroButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          SizedBox(width: 8),
          Text(
            'Torna al login',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white
            ),
          ),
        ],
      ),
    );
  }
}