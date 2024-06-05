import 'package:flutter/material.dart';

class NavigazioneAppbar {
  static AppBar buildAppBar({
    required String title,
    VoidCallback? leadingOnPressed,
    VoidCallback? trailingOnPressed,
  }) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: leadingOnPressed ?? () {},
      ),
      title: Text(title),
      backgroundColor: Colors.redAccent,
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.account_circle),
          onPressed: trailingOnPressed ?? () {},
        ),
      ],
    );
  }
}
