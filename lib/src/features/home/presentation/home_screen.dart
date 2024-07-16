import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ super.key });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          // Container(
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage("assets/images/scacchiBackground2.jpg"),
          //       fit: BoxFit.cover,
          //       // TODO valutare se usare l'opacità o cambiare immagini di BG
          //     ),
          //   ),
          // ),
          // Foreground content with padding
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'MSC Cruises Japanese Grand Prix',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, //white
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  '4-5 Aprile 2024',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black, //white70
                  ),
                ),
                const SizedBox(height: 16.0),
                Image.asset(
                  'assets/images/map.png',
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 16.0),
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(),
                    1: FlexColumnWidth(),
                  },
                  border: TableBorder.all(color: Colors.grey),
                  children: [
                    TableRow(
                      children: [
                        Container(
                          height: 60,
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(child: Text('Primo GP')),
                        ),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(child: Text('Lunghezza Circuito')),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Container(
                          height: 60,
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(child: Text('N° Giri')),
                        ),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(child: Text('Distanza Percorsa')),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Container(
                          height: 60,
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(child: Text('Record')),
                        ),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(child: Text('Pole Position 2023')),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Container(
                          height: 60,
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(child: Text('Giro Più Veloce 2023')),
                        ),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(child: Text('Vincitore 2023')),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

