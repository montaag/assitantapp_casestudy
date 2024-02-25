import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatefulWidget {
  final void Function(String)? onChanged;
  final String hintText;
  const CustomTextFormFiled({super.key, required this.onChanged, required this.hintText});

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(15.0),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(25.0),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(25.0),
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
