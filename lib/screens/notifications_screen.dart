import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Liste des notifications
    final List<Map<String, dynamic>> notifications = [
      {
        'icon': Icons.code_rounded,
        'color': Colors.blue,
        'title': "Développement de l'application",
        'subtitle': "La structure de base de l'application a été créée.",
        'time': "à l'instant",
      },
      {
        'icon': Icons.lock_outline_rounded,
        'color': Colors.orange,
        'title': "Fonctionnalités en pause",
        'subtitle': "Certaines fonctionnalités sont gelées pour faciliter une mise à jour du code.",
        'time': "il y a 2 min",
      },
      {
        'icon': Icons.support_agent_rounded,
        'color': Colors.green,
        'title': "Support technique",
        'subtitle': "Pour toute question, veuillez contacter le développeur au +225 05 86 83 60 54.",
        'time': "il y a 5 min",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      // On remplace le message centré par une ListView
      body: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const Divider(indent: 70, height: 1),
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 24,
              backgroundColor: notif['color'].withAlpha(30),
              child: Icon(
                notif['icon'],
                color: notif['color'],
              ),
            ),
            title: Text(
              notif['title'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(notif['subtitle']),
            trailing: Text(
              notif['time'],
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            onTap: () {},
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          );
        },
      ),
    );
  }
}