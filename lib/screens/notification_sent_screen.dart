// lib/screens/notification_sent_screen.dart

import 'package:flutter/material.dart';

class NotificationSentScreen extends StatelessWidget {
  const NotificationSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    // Remplace ceci par ta propre image
                    // Image.asset('assets/images/thumbs_up.png', height: 100),
                    const Icon(Icons.thumb_up_alt_rounded, size: 100, color: Colors.blue),
                    const SizedBox(height: 32),
                    const Text(
                      "Notification has been sent to the Merchant",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 32),
                    _buildStatusCard(),
                    const SizedBox(height: 24),
                    _buildChatCard(),
                  ],
                ),
              ),
            ),
            _buildDoneButton(context),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Le widget pour la carte de statut
  Widget _buildStatusCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildStatusStep(
            text: "Notification Sent",
            isCompleted: true,
          ),
          _buildStatusStep(
            text: "Crypto deducted from merchant's balance to an escrow account",
            isCompleted: true,
          ),
          _buildStatusStep(
            text: "Awaiting merchant's confirmation",
            isCompleted: false,
            isLast: true,
          ),
        ],
      ),
    );
  }

  // Le widget pour une étape du statut
  Widget _buildStatusStep({required String text, required bool isCompleted, bool isLast = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: isCompleted ? Colors.blue : Colors.grey.shade300,
              child: Icon(Icons.check, color: Colors.white, size: 14),
            ),
            if (!isLast)
              Container(
                height: 40,
                width: 2,
                color: Colors.grey.shade300,
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }

  // Le widget pour la carte de chat
  Widget _buildChatCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        leading: const CircleAvatar(
          // Remplacer par une vraie image
          backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=12'),
        ),
        title: const Text("Crypto Lurd", style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: const Text("Chat with agent"),
        trailing: Stack(
          alignment: Alignment.topRight,
          children: [
            const Icon(Icons.chat_bubble_outline, color: Colors.black, size: 28),
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Le bouton "Done" en bas
  Widget _buildDoneButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Navigue vers la page d'accueil par exemple
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text("Done", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}