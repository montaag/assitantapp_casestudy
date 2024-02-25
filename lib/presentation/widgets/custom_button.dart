import 'package:flutter/material.dart';

enum CustomButtonType { primary, secondary }

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final CustomButtonType buttonType;
  const CustomButton({super.key, required this.title, this.onPressed, required this.buttonType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: buttonType == CustomButtonType.primary ? Colors.transparent : Colors.red),
        ),
        color: buttonType == CustomButtonType.primary ? Colors.lightGreen : Colors.white,
        elevation: 0,
        child: MaterialButton(
          minWidth: double.maxFinite,
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(color: buttonType == CustomButtonType.primary ? Colors.white : Colors.red),
          ),
        ),
      ),
    );
  }
}
