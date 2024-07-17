import 'package:flutter/material.dart';

class TableCellWidget extends StatelessWidget {
  final String text;

  const TableCellWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(text),
      ),
    );
  }
}