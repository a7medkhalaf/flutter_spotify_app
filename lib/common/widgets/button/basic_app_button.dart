import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const BasicAppButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(70),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
