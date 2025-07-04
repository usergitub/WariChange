import 'package:flutter/material.dart';
import 'buy_btc_screen.dart'; // <--- 1. L'IMPORT A ÉTÉ AJOUTÉ

class MerchantsScreen extends StatelessWidget {
  const MerchantsScreen({super.key});

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
        title: const Text("Merchants", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildFilters(),
            const SizedBox(height: 24),
            // La liste des marchands
            Expanded(
              child: ListView.separated(
                itemCount: 5, // Affiche 5 cartes pour l'exemple
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  // --- 2. ON PASSE LE CONTEXT ICI ---
                  return _buildMerchantCard(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilters() {
    return Column(
      children: [
        Row(
          children: [
            // Boutons Buy/Sell
            ToggleButtons(
              isSelected: const [true, false],
              onPressed: (int index) {},
              borderRadius: BorderRadius.circular(8.0),
              selectedColor: Colors.white,
              fillColor: Colors.blue,
              color: Colors.black,
              children: const [
                Padding(padding: EdgeInsets.symmetric(horizontal: 16.0), child: Text("Buy")),
                Padding(padding: EdgeInsets.symmetric(horizontal: 16.0), child: Text("Sell")),
              ],
            ),
            const Spacer(),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.filter_list),
              label: const Text("Filter"),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                side: BorderSide(color: Colors.grey.shade300),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            // Champ pour le montant
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Enter Amount",
                  suffixText: "NGN",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 16),
            // Sélecteur de crypto
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Row(
                children: [
                  Text("BTC", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  // --- 3. LA MÉTHODE REÇOIT LE CONTEXT ---
  Widget _buildMerchantCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=12'),
              ),
              const SizedBox(width: 8),
              const Text("Crypto Lurd", style: TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              const Text("₦20,000,000.00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Colonne d'informations
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _infoRow( "Volume: 0.0212 BTC"),
                    const SizedBox(height: 4),
                    _infoRow("Min: ₦100,000   Max: ₦500,000"),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _infoRowWithIcon(Icons.message_outlined, "150 Trades"),
                        const SizedBox(width: 12),
                        _infoRowWithIcon(Icons.thumb_up_alt_outlined, "98%"),
                         const SizedBox(width: 12),
                        _infoRowWithIcon(Icons.timer_outlined, "5 mins"),
                      ],
                    )
                  ],
                ),
              ),
              // Bouton Buy
              ElevatedButton(
                // --- 4. L'ACTION DE NAVIGATION EST AJOUTÉE ---
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const BuyBtcScreen())
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Buy"),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _infoRow(String text) {
    return Text(text, style: TextStyle(color: Colors.grey.shade600, fontSize: 12));
  }

  Widget _infoRowWithIcon(IconData icon, String text) {
     return Row(
      children: [
        Icon(icon, color: Colors.grey.shade600, size: 14),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
      ],
    );
  }
}