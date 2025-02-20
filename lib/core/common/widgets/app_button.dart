import 'package:bringr/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPress;
  final String buttonText;
  const AppButton({super.key, required this.onPress, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: AppPalette.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPalette.primaryColor,
          shadowColor: AppPalette.transparentColor,
        ),
        onPressed: onPress,
        child: Text(
          buttonText,
          style: TextStyle(
            color: AppPalette.backgroundColor,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
