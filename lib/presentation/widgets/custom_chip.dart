import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final bool isOutlined;
  final String text;
  const CustomChip({
    super.key,
    this.isOutlined = false,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(180),
        color: isOutlined ? Colors.white : Colors.red,
        border: Border.all(color: isOutlined ? Colors.red : Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: Center(
          child: Text(text,
              style: TextStyle(
                color: isOutlined ? Colors.black : Colors.white,
              )),
        ),
      ),
    );
  }
}
