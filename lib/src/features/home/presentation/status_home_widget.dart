import 'package:flutter/material.dart';

import 'package:fanta_phoenix/src/utils/style.dart';

class StatusHomeWidget extends StatefulWidget {
  const StatusHomeWidget({super.key});

  @override
  State<StatusHomeWidget> createState() => _StatusHomeWidgetState();
}

class _StatusHomeWidgetState extends State<StatusHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: kBoxDecorationStyle,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Prossima WEC',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'VS Buco e Spinno',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(width: 15),
                const Text(
                  'Formazione\n& Pronostici:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 15),
                Image.asset(
                  'assets/images/scacchiBackground1.jpg',
                  height: 70,
                  width: 40,
                ),
              ],    
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Gettoni in gioco',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 16.0),
                Image.asset(
                  'assets/images/gettoni/autopilota.png',
                  height: 30,
                  width: 30,
                ),
                Image.asset(
                  'assets/images/gettoni/extraBoost.png',
                  height: 30,
                  width: 30,
                ),
                Image.asset(
                  'assets/images/gettoni/extraDRS.png',
                  height: 30,
                  width: 30,
                ),
                Image.asset(
                  'assets/images/gettoni/fondiIllimitati.png',
                  height: 30,
                  width: 30,
                ),
                Image.asset(
                  'assets/images/gettoni/noMalus.png',
                  height: 30,
                  width: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}