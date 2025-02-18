import 'package:bringr/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPress;
  const AuthButton({
    super.key,
    required this.buttonText,
    required this.onPress,
  });

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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPress,
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 18, color: AppPalette.backgroundColor),
        ),
      ),
    );
  }
}
