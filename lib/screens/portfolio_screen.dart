// lib/screens/portfolio_screen.dart

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Portfolio", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildBalanceCard(),
            const SizedBox(height: 32),
            _buildWalletsHeader(),
            const SizedBox(height: 16),
            _buildWalletList(),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4A80F0), Color(0xFF4B63F2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          // Le graphique en arrière-plan
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 200,
              height: 80,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [ FlSpot(0, 1), FlSpot(1, 1.5), FlSpot(2, 1.4), FlSpot(3, 2.8), FlSpot(4, 2.5), FlSpot(5, 3), FlSpot(6, 2.6) ],
                      isCurved: true,
                      color: Colors.white.withOpacity(0.5),
                      barWidth: 3,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Le contenu texte
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text("Total wallet balance", style: TextStyle(color: Colors.white70)),
                  Spacer(),
                  Text("USD", style: TextStyle(color: Colors.white)),
                  Icon(Icons.arrow_drop_down, color: Colors.white),
                ],
              ),
              const SizedBox(height: 8),
              const Text("\$2,500.00", style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Text("Profit this month", style: TextStyle(color: Colors.white70)),
                  const SizedBox(width: 16),
                  Text("\$25.09", style: TextStyle(color: Colors.white.withOpacity(0.9))),
                  const SizedBox(width: 8),
                  Text("+10%", style: TextStyle(color: Colors.green.shade300)),
                  Icon(Icons.trending_up, color: Colors.green.shade300, size: 16),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWalletsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Wallets", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text("Add Currency"),
        ),
      ],
    );
  }

  Widget _buildWalletList() {
    // Liste statique pour l'exemple
    return Column(
      children: [
        _walletTile(Icons.currency_bitcoin, Colors.orange, "Bitcoin", "0.235 BTC", "\$50,023.03", "+10%", Colors.green),
        const Divider(),
        _walletTile(Icons.token, Colors.indigo, "Ethereum", "1.0043 ETH", "\$34.65", "-35.0%", Colors.red),
        const Divider(),
        _walletTile(Icons.circle, Colors.green, "Tether", "20.67 USDT", "\$233.89", "+10.90%", Colors.green),
        const Divider(),
        _walletTile(Icons.ac_unit, Colors.pink, "Uniswap", "200.89 UNI", "\$10.00", "+10.90%", Colors.green),
        const Divider(),
        _walletTile(Icons.blur_circular, Colors.blue, "Cardano", "1.0043 ADA", "\$89.90", "-13.90%", Colors.red),
      ],
    );
  }

  Widget _walletTile(IconData icon, Color iconBgColor, String name, String balance, String usdValue, String change, Color changeColor) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
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