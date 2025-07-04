// lib/widgets/quick_actions_sheet.dart

import 'package:flutter/material.dart';
import '../screens/merchants_screen.dart'; // <--- 1. L'IMPORT A ÉTÉ AJOUTÉ

class QuickActionsSheet extends StatelessWidget {
  const QuickActionsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(height: 24),
          _buildActionTile(
            context,
            icon: Icons.storefront_outlined,
            iconBgColor: Colors.blue.shade100,
            iconColor: Colors.blue,
            title: "Merchants",
            subtitle: "Buy and sell cryptocurrency from our verified crypto agents",
            // --- 2. L'ACTION DE NAVIGATION EST AJOUTÉE ICI ---
            onTap: () {
              // Ferme la sheet d'abord
              Navigator.pop(context);
              // Ensuite, ouvre la page des marchands
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MerchantsScreen()));
            },
          ),
          _buildActionTile(
            context,
            icon: Icons.send_outlined,
            iconBgColor: Colors.blue.shade100,
            iconColor: Colors.blue,
            title: "Send/Receive",
            subtitle: "Send or receive crypto from your friends and family.",
          ),
          _buildActionTile(
            context,
            icon: Icons.phone_android_outlined,
            iconBgColor: Colors.blue.shade100,
            iconColor: Colors.blue,
            title: "Buy Airtime",
            subtitle: "Recharge any phone number with any of your coins",
          ),
          _buildActionTile(
            context,
            icon: Icons.receipt_long_outlined,
            iconBgColor: Colors.blue.shade100,
            iconColor: Colors.blue,
            title: "Pay Bills",
            subtitle: "Pay your electricity and other utility bills with any of your coins",
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // --- 3. LA MÉTHODE EST MISE À JOUR POUR ACCEPTER "onTap" ---
  Widget _buildActionTile(
    BuildContext context, {
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    required String subtitle,
    VoidCallback? onTap, // Le 'onTap' est maintenant un paramètre optionnel
  }) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: iconBgColor,
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap, // On utilise le paramètre onTap ici
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
    );
  }
}