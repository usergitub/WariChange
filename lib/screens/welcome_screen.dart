// lib/screens/welcome_screen.dart
import 'package:flutter/material.dart';

import 'main_navigation_screen.dart'; // <--- IMPORTE la page de navigation principale


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0052FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Spacer(),
              const Text(
                'WariChange', // J'ai aussi mis à jour le nom ici
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  // --- MODIFICATION ICI ---
                  onPressed: () {
                    // Navigue vers la page d'accueil sans possibilité de retour
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
                    );
                  },
                  // ... le reste du style ne change pas
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Get started',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // ... le reste du code ne change pas
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    // TODO: Ajouter la logique pour "Sign in"
                  },
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}