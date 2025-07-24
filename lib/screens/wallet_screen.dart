import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  double _balance = 0.0;
  List<Map<String, String>> _history = [
    {'amount': '₦13,500', 'date': '6:00 am 12 Mar 2025', 'status': 'Successful'},
    {'amount': '₦13,500', 'date': '6:00 am 12 Mar 2025', 'status': 'Pending'},
    {'amount': '₦13,500', 'date': '6:00 am 12 Mar 2025', 'status': 'Failed'},
    {'amount': '₦13,500', 'date': '6:00 am 12 Mar 2025', 'status': 'Reversed'},
  ];
  bool _showAddFund = false;
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Wallet', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Wallet Balance', style: TextStyle(color: Colors.black54)),
                        const SizedBox(height: 4),
                        Text('₦${_balance.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () => setState(() => _showAddFund = true),
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF386641)),
                      child: const Text('+ Add fund'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text('History', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            Expanded(
              child: _history.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.history, size: 64, color: Colors.grey.shade400),
                          const SizedBox(height: 16),
                          const Text('No history', style: TextStyle(fontSize: 16, color: Colors.black54)),
                          const Text('You currently have no history', style: TextStyle(color: Colors.black54)),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: _history.length,
                      itemBuilder: (context, index) {
                        final item = _history[index];
                        Color statusColor;
                        switch (item['status']) {
                          case 'Successful':
                            statusColor = Colors.green;
                            break;
                          case 'Pending':
                            statusColor = Colors.orange;
                            break;
                          case 'Failed':
                            statusColor = Colors.red;
                            break;
                          case 'Reversed':
                            statusColor = Colors.grey;
                            break;
                          default:
                            statusColor = Colors.black54;
                        }
                        return ListTile(
                          leading: Icon(Icons.account_balance_wallet, color: statusColor),
                          title: Text(item['amount']!),
                          subtitle: Text(item['date']!),
                          trailing: Text(item['status']!, style: TextStyle(color: statusColor, fontWeight: FontWeight.bold)),
                        );
                      },
                    ),
            ),
            if (_showAddFund) _buildAddFundSheet(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAddFundSheet(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Add fund', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 8),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Enter amount'),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: ListTile(
              leading: const Icon(Icons.account_balance, color: Color(0xFF386641)),
              title: const Text('Wema Bank'),
              subtitle: const Text('89661141056\nMacky\'s Food - Jimoh Adesina'),
              isThreeLine: true,
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _showAddFund = false;
                _history.insert(0, {
                  'amount': '₦${_amountController.text}',
                  'date': 'Now',
                  'status': 'Pending',
                });
                _amountController.clear();
              });
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF386641)),
            child: const Text('Confirm transfer'),
          ),
        ],
      ),
    );
  }
} 