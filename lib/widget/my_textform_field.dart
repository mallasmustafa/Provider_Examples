import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isDescription;
  const MyTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isDescription = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: isDescription ? 5 : 1,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
