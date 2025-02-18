import 'package:bringr/core/theme/theme.dart';
import 'package:bringr/feature/auth/presentation/screens/sign_up_screen.dart';
import 'package:bringr/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bringr',
      theme: AppTheme.lightThemeMode,
      home: SignUpScreen(),
    );
  }
}
