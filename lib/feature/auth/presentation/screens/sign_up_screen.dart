import 'package:bringr/core/theme/app_palette.dart';
import 'package:bringr/feature/auth/presentation/widgets/auth_button.dart';
import 'package:bringr/feature/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return Form(
                  key: formKey,
                  child: Column(
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sign Up", style: TextStyle(fontSize: 50)),
                      AuthField(controller: nameController, hintText: "Name"),
                      AuthField(controller: emailController, hintText: "Email"),
                      AuthField(
                        controller: passwordController,
                        hintText: "Password",
                      ),
                      AuthButton(
                        buttonText: "Sign Up",
                        onPress: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                              AuthSignUp(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                                name: nameController.text,
                              ),
                            );
                          }
                        },
                      ),
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
                );
              },
            );
          },
        ),
      ),
    );
  }
}
