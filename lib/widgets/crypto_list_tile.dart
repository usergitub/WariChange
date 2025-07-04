import 'package:flutter/material.dart';

class CryptoListTile extends StatelessWidget {
  final IconData icon;
  final Color iconBgColor;
  final String name;
  final String balance;
  final String usdValue;
  final String change;
  final Color changeColor;

  const CryptoListTile({
    super.key,
    required this.icon,
    required this.iconBgColor,
    required this.name,
    required this.balance,
    required this.usdValue,
    required this.change,
    required this.changeColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: iconBgColor.withOpacity(0.1),
        child: Icon(icon, color: iconBgColor),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(balance, style: const TextStyle(color: Colors.grey)),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(usdValue, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(change, style: TextStyle(color: changeColor)),
        ],
      ),
    );
  }
}