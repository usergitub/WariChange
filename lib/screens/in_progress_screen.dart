// lib/screens/in_progress_screen.dart

import 'dart:async';
import 'package:flutter/material.dart';

class InProgressScreen extends StatefulWidget {
  const InProgressScreen({super.key});

  @override
  State<InProgressScreen> createState() => _InProgressScreenState();
}

class _InProgressScreenState extends State<InProgressScreen> {
  late Timer _timer;
  late DateTime _startTime;
  late DateTime _endTime;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    // Définit les heures de début et de fin
    _startTime = DateTime.now();
    _endTime = _startTime.add(const Duration(hours: 24));

    // Crée un minuteur qui se met à jour toutes les secondes
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // Calcule la progression
      final now = DateTime.now();
      if (now.isAfter(_endTime)) {
        // Si le temps est écoulé, on met à 100% et on arrête le minuteur
        setState(() {
          _progress = 1.0;
        });
        _timer.cancel();
      } else {
        final totalDuration = _endTime.difference(_startTime).inSeconds;
        final elapsedDuration = now.difference(_startTime).inSeconds;
        setState(() {
          _progress = elapsedDuration / totalDuration;
        });
      }
    });
  }

  @override
  void dispose() {
    // Il est TRÈS IMPORTANT d'arrêter le minuteur pour ne pas vider la batterie
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mise à jour"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.construction_outlined,
                size: 80,
                color: Colors.blue.shade300,
              ),
              const SizedBox(height: 32),
              const Text(
                "En cours de déploiement...",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              LinearProgressIndicator(
                value: _progress,
                minHeight: 10,
                borderRadius: BorderRadius.circular(5),
                backgroundColor: Colors.grey.shade300,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              const SizedBox(height: 16),
              Text(
                "${(_progress * 100).toStringAsFixed(1)} %",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 32),
              const Text(
                "Veuillez brancher votre téléphone.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}