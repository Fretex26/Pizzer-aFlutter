import 'package:flutter/material.dart';

class ATextField extends StatelessWidget {

  final TextEditingController controller;
  final String textBack;
  final bool isPassword;
  final Color color;

  const ATextField({
    super.key,
    required this.controller,
    required this.textBack,
    required this.isPassword,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color: Colors.grey.shade700
            )
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color: Colors.white
            )
          ),
          fillColor: color,
          filled: true,
          hintText: textBack,
          hintStyle: TextStyle(color: Colors.grey.shade500,)
        ),
      ),
    );
  }
}