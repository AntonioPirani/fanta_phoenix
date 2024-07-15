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
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://via.placeholder.com/800'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground content with padding
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Subtitle',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 16.0),
                Image.network(
                  'https://via.placeholder.com/150',
                  height: 150,
                  width: 150,
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
                          child: const Center(child: Text('Text 1')),
                        ),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(child: Text('Text 2')),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Container(
                          height: 60,
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(child: Text('Text 3')),
                        ),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(child: Text('Text 4')),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Container(
                          height: 60,
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(child: Text('Text 5')),
                        ),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(child: Text('Text 6')),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Container(
                          height: 60,
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(child: Text('Text 7')),
                        ),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(child: Text('Text 8')),
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

