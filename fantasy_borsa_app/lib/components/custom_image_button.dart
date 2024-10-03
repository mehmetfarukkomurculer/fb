import 'package:flutter/material.dart';

class CustomImageButton extends StatelessWidget {
  const CustomImageButton({super.key, required this.onTap, required this.path});

  final VoidCallback onTap;
  final String path;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Image.asset(path),
      iconSize: 25,
    );
  }
}
