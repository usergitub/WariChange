import 'package:flutter/material.dart';
import 'pay_merchant_screen.dart'; // <--- 1. L'IMPORT A ÉTÉ AJOUTÉ

class BuyBtcScreen extends StatelessWidget {
  const BuyBtcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        title: const Text("Buy BTC", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAmountCard(),
                  _buildSwapIcon(),
                  _buildCryptoVolumeCard(),
                  const SizedBox(height: 24),
                  _buildMerchantInfoCard(),
                ],
              ),
            ),
          ),
          _buildProceedButton(context),
        ],
      ),
    );
  }

  Widget _buildAmountCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: const CircleAvatar(
          radius: 24,
          backgroundColor: Colors.blue,
          child: Text("₦", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
        ),
        title: const Text("Nigeria Naira"),
        subtitle: const Text("₦100,000", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
        trailing: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("NGN", style: TextStyle(fontWeight: FontWeight.bold)),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }

  Widget _buildSwapIcon() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: CircleAvatar(
        backgroundColor: Colors.orange.shade100,
        child: const Icon(Icons.swap_vert, color: Colors.orange),
      ),
    );
  }

  Widget _buildCryptoVolumeCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: const CircleAvatar(
          radius: 24,
          backgroundColor: Colors.orange,
          child: Icon(Icons.currency_bitcoin, color: Colors.white),
        ),
        title: const Text("Bitcoin"),
        subtitle: const Text("0.00235 BTC", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
        trailing: TextButton(
          onPressed: () {},
          child: const Text("Refresh"),
        ),
      ),
    );
  }

  Widget _buildMerchantInfoCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=12'),
                ),
                const SizedBox(width: 12),
                const Text("Crypto Lurd", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text("Price: ₦20,000,000.00", style: TextStyle(fontSize: 12)),
                    Text("Min: 100,000.00   Max: 200,000.00", style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                  ],
                )
              ],
            ),
            const Divider(height: 24),
            Text(
              "I am online. Please do not include any crypto related keywords like BTC, BNB, ETH, Norva on the narration. Thanks for doing business with me.",
              style: TextStyle(color: Colors.grey.shade700, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProceedButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          // --- 2. LA LOGIQUE DE NAVIGATION EST AJOUTÉE ICI ---
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const PayMerchantScreen())
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text("Proceed", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}