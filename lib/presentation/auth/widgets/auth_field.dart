import 'package:flutter/material.dart';

class AuthFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;
  const AuthFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    required this.isObscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: isObscureText,
        decoration: InputDecoration(
          suffixIcon:
              isObscureText ? const Icon(Icons.remove_red_eye_outlined) : null,
          hintText: hintText,
        ),
      ),
    );
  }
}
