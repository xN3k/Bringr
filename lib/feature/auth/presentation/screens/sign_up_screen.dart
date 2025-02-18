import 'package:bringr/core/theme/app_palette.dart';
import 'package:bringr/feature/auth/presentation/widgets/auth_button.dart';
import 'package:bringr/feature/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign Up", style: TextStyle(fontSize: 50)),
            AuthField(controller: emailController, hintText: "Name"),
            AuthField(controller: emailController, hintText: "Email"),
            AuthField(controller: passwordController, hintText: "Password"),
            AuthButton(buttonText: "Sign Up", onPress: () {}),
            RichText(
              text: TextSpan(
                text: "Already have an account? ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ), // Add style here
                children: [
                  TextSpan(
                    text: "Sign In",
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
