import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        title: const Text("Profile", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 24),
              _buildProfileHeader(),
              const SizedBox(height: 24),
              _buildInviteBanner(),
              const SizedBox(height: 24),
              _buildOptionList(),
              const SizedBox(height: 32),
              _buildSignOut(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 40,
          // --- MODIFICATION DE L'IMAGE ---
          backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=60'),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // --- MODIFICATION DU NOM ---
            const Text("TOUPETIT", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Text("Verified", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                  SizedBox(width: 4),
                  Icon(Icons.check_circle, color: Colors.green, size: 16),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // --- MODIFICATION DU USERNAME ---
            Text("@toupetit10", style: TextStyle(color: Colors.grey, fontSize: 16)),
            SizedBox(width: 4),
            Icon(Icons.history_toggle_off, color: Colors.grey, size: 16),
          ],
        ),
      ],
    );
  }

  // ... (Le reste du code de ce fichier ne change pas)
  Widget _buildInviteBanner() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2A5D),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const ListTile(
        leading: Icon(Icons.card_giftcard, color: Colors.white),
        title: Text("Invite your friends.", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: Text("Earn Crypto Together!", style: TextStyle(color: Colors.white70)),
      ),
    );
  }

  Widget _buildOptionList() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _optionTile(Icons.person_outline, "Account Profile"),
          _optionTile(Icons.shield_outlined, "Account Verification", subtitle: "Not Verified", subtitleColor: Colors.orange),
          _optionTile(Icons.account_balance_wallet_outlined, "Bank Accounts"),
          _optionTile(Icons.lock_outline, "Security"),
          _optionTile(Icons.monetization_on_outlined, "Default Currency", trailing: _trailingWidget("USD", Icons.flag_circle, Colors.red)),
          _optionTile(Icons.translate_outlined, "Language", trailing: _trailingWidget("ENG", null, null, showDropdown: true)),
          _optionTile(Icons.help_outline, "Help & Support"),
        ],
      ),
    );
  }

  Widget _optionTile(IconData icon, String title, {String? subtitle, Color? subtitleColor, Widget? trailing}) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey.shade600),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: subtitle != null ? Text(subtitle, style: TextStyle(color: subtitleColor)) : null,
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {},
    );
  }

  Widget _trailingWidget(String text, IconData? icon, Color? iconColor, {bool showDropdown = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) Icon(icon, color: iconColor, size: 24),
        if (icon != null) const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(width: 4),
        Icon(showDropdown ? Icons.arrow_drop_down : Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ],
    );
  }

  Widget _buildSignOut() {
    return Column(
      children: [
        const Text(
          "Sign Out",
          style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          "Version 1.0",
          style: TextStyle(color: Colors.grey.shade600),
        ),
      ],
    );
  }
}