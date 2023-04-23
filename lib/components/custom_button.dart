import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final Function() action;
  
  const CustomButton({
    super.key,
    required this.text,
    required this.action
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
          width: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: const Color.fromRGBO(86, 89, 2, 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.grey.shade100
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}