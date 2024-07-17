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
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: kBoxDecorationStyle,
        padding: const EdgeInsets.all(16.0),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Column 1, Text 1',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Column 1, Text 2',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Column 2, Text 1',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Column 2, Text 2',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}