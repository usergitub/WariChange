import 'package:flutter/material.dart';
import 'package:coinbase/screens/splash_screen.dart'; // Assure-toi que le chemin est correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coinbase Clone',
      theme: ThemeData(
        fontFamily: 'sans-serif', // Tu peux définir une police ici
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(), // On commence par le splash screen
    );
  }
}