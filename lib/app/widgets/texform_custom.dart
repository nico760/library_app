import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  const TextCustom({super.key,
  required this.controller
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(controller: controller,
      cursorColor: Colors.purple,
      decoration: InputDecoration(
        labelText: 'keyword',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.purple,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.purple,
          ),
        ),
        ),
      );
  }
}