import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'notifications_screen.dart'; 

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _buildAppBar(context),
              const SizedBox(height: 24),
              _buildPromoCard(),
              const SizedBox(height: 24),
              _buildIdentityBanner(),
              const SizedBox(height: 24),
              _buildPortfolioBalance(),
              const SizedBox(height: 24),
              _buildActionButtons(),
              const SizedBox(height: 32),
              _buildSectionHeader("Portfolio", () {}),
              const SizedBox(height: 16),
              _buildPortfolioList(),
              const SizedBox(height: 32),
              _buildSectionHeader("Trending", () {}),
              const SizedBox(height: 16),
              _buildTrendingList(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=60'),
        ),
        const SizedBox(width: 12),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- MODIFICATIONS ICI ---
            Text("TOUPETIT", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text("@toupetit10", style: TextStyle(color: Colors.grey)),
          ],
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.notifications_outlined, size: 28),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const NotificationsScreen(),
              ),
            );
          },
        ),
      ],
    );
  }

  // ... (Le reste du code de ce fichier ne change pas)
  Widget _buildPromoCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2A5D),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Stake your Bitcoin and enter our BTC Price Pool",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "Learn More",
                  style: TextStyle(color: Colors.white70, decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Icon(Icons.pie_chart, color: Colors.blue.shade200, size: 60),
        ],
      ),
    );
  }

  Widget _buildIdentityBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const Row(
        children: [
          Icon(Icons.shield_outlined, color: Colors.orange),
          SizedBox(width: 12),
          Expanded(child: Text("Kindly verify your identity to unlock all the features of the app.")),
          Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }

  Widget _buildPortfolioBalance() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Portfolio Balance", style: TextStyle(color: Colors.grey.shade600, fontSize: 16)),
            const SizedBox(width: 8),
            Icon(Icons.visibility_off_outlined, color: Colors.grey.shade600, size: 20),
            const Spacer(),
            const Text("USD", style: TextStyle(fontWeight: FontWeight.bold)),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
        const SizedBox(height: 8),
        const Text("\$0.00", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _actionButton(Icons.swap_horiz, "Buy/Sell"),
        _actionButton(Icons.send_outlined, "Send"),
        _actionButton(Icons.vertical_align_bottom_outlined, "Receive"),
        _actionButton(Icons.payment_outlined, "Pay"),
      ],
    );
  }

  Widget _actionButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.black87, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onViewAll) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        TextButton(onPressed: onViewAll, child: const Text("View all")),
      ],
    );
  }

  Widget _buildPortfolioList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _portfolioCard("Bitcoin", "\$50,023.03", "0.235 BTC", "+10%", Colors.green, Icons.currency_bitcoin),
          const SizedBox(width: 16),
          _portfolioCard("Ethereum", "\$250.89", "0.935 ETH", "-15%", Colors.red, Icons.token),
        ],
      ),
    );
  }

  Widget _portfolioCard(String name, String value, String balance, String change, Color changeColor, IconData icon) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 32),
          const SizedBox(height: 16),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(balance, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: changeColor.withAlpha(26),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(change, style: TextStyle(color: changeColor, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  Widget _buildTrendingList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _trendingTile(Colors.orange, "BTC", "Bitcoin", "\$20,000.34", "+9.77%", Colors.green),
          _trendingTile(Colors.purple, "ETH", "Ethereum", "\$1,00.34", "-2.77%", Colors.red),
          _trendingTile(Colors.green, "USDT", "Tether USD", "\$1.01", "+1.1%", Colors.green),
          _trendingTile(Colors.yellow.shade700, "BNB", "Binance Coin", "\$245.98", "-2.3%", Colors.red),
        ],
      ),
    );
  }
  
  Widget _trendingTile(Color circleColor, String symbol, String name, String price, String change, Color changeColor) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: circleColor,
        child: Text(symbol[0], style: const TextStyle(color: Colors.white)),
      ),
      title: Text(symbol, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(name),
      trailing: SizedBox(
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 50,
              height: 30,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [ FlSpot(0, 1), FlSpot(1, 1.5), FlSpot(2, 1.4), FlSpot(3, 1.8), FlSpot(4, 1.7), FlSpot(5, 2) ],
                      isCurved: true,
                      color: changeColor,
                      barWidth: 2,
                      dotData: const FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(change, style: TextStyle(color: changeColor)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}