import 'package:bringr/core/theme/app_palette.dart';
import 'package:bringr/feature/auth/presentation/widgets/auth_button.dart';
import 'package:bringr/feature/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome Back", style: TextStyle(fontSize: 50)),
            AuthField(controller: emailController, hintText: "email"),
            AuthField(controller: passwordController, hintText: "password"),
            AuthButton(buttonText: "Sign In", onPress: () {}),
            RichText(
              text: TextSpan(
                text: "Don't have an account? ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ), // Add style here
                children: [
                  TextSpan(
                    text: "Sign Up",
                    style: TextStyle(
                      color: AppPalette.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
