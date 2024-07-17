import 'package:flutter/material.dart';
import 'package:fanta_phoenix/src/features/home/presentation/status_home_widget.dart';
import 'package:fanta_phoenix/src/utils/tablecell_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isTeamActive = true; // ! Quando la squadra è registrata o meno

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
            child: SingleChildScrollView( // Add SingleChildScrollView here
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Visibility(
                    visible: isTeamActive,
                    child: const StatusHomeWidget(),
                  ),
                  const Text(
                    'MSC Cruises Japanese Grand Prix',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // white
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    '4-5 Aprile 2024',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black, // white70
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
                    children: const [
                      TableRow(
                        children: [
                          TableCellWidget(text: 'Primo GP'),
                          TableCellWidget(text: 'Lunghezza Circuito'),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCellWidget(text: 'N° Giri'),
                          TableCellWidget(text: 'Distanza Percorsa'),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCellWidget(text: 'Record'),
                          TableCellWidget(text: 'Pole Position 2023'),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCellWidget(text: 'Giro Più Veloce 2023'),
                          TableCellWidget(text: 'Vincitore 2023'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}