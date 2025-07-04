import 'package:flutter/material.dart';
import '../widgets/crypto_list_tile.dart'; // Importe le widget réutilisable
import 'currency_chart_screen.dart'; // <--- 1. IMPORTE LA NOUVELLE PAGE

class MarketsScreen extends StatelessWidget {
  const MarketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Markets", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildFilterButtons(),
            const SizedBox(height: 24),
            Expanded(
              // --- 2. PASSE LE CONTEXT À LA MÉTHODE ---
              child: _buildAssetList(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButtons() {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _filterButton("All Assets", isSelected: true),
          _filterButton("Gainers"),
          _filterButton("Losers"),
          _filterButton("Favourites"),
        ],
      ),
    );
  }

  Widget _filterButton(String text, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.grey.shade200,
          foregroundColor: isSelected ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 0,
        ),
        child: Text(text),
      ),
    );
  }

  // --- 3. LA MÉTHODE REÇOIT LE CONTEXT ---
  Widget _buildAssetList(BuildContext context) {
    return ListView(
      children: [
        // --- 4. L'ÉLÉMENT DE LISTE EST MAINTENANT CLIQUABLE ---
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const CurrencyChartScreen())
            );
          },
          child: const CryptoListTile(
            icon: Icons.currency_bitcoin, iconBgColor: Colors.orange,
            name: "Bitcoin", balance: "0.235 BTC",
            usdValue: "\$50,023.03", change: "+10%", changeColor: Colors.green,
          ),
        ),
        InkWell(
           onTap: () { // Tu peux répéter la navigation pour chaque élément
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const CurrencyChartScreen())
            );
          },
          child: const CryptoListTile(
            icon: Icons.token, iconBgColor: Colors.indigo,
            name: "Ethereum", balance: "1.0043 ETH",
            usdValue: "\$34.65", change: "-35.0%", changeColor: Colors.red,
          ),
        ),
        const CryptoListTile(
          icon: Icons.circle, iconBgColor: Colors.green,
          name: "Tether", balance: "20.67 USDT",
          usdValue: "\$233.89", change: "+10.90%", changeColor: Colors.green,
        ),
        const CryptoListTile(
          icon: Icons.ac_unit, iconBgColor: Colors.pink,
          name: "Uniswap", balance: "200.89 UNI",
          usdValue: "\$10.00", change: "+10.90%", changeColor: Colors.green,
        ),
         const CryptoListTile(
          icon: Icons.blur_circular, iconBgColor: Colors.blue,
          name: "Cardano", balance: "1.0043 ADA",
          usdValue: "\$89.90", change: "-13.90%", changeColor: Colors.red,
        ),
      ],
    );
  }
}