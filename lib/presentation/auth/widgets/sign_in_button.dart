import 'package:flutter/material.dart';
import 'package:flutter_spotify_app/common/utils/is_dark_mode.dart';

class SingInButton extends StatelessWidget {
  final VoidCallback onPressed;
  const SingInButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        side: MaterialStatePropertyAll(
          BorderSide(
            color: context.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        minimumSize: const MaterialStatePropertyAll(
          Size.fromHeight(70),
        ),
      ),
      onPressed: onPressed,
      child: const Text(
        'Sign In',
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
