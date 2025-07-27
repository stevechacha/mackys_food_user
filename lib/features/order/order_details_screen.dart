import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

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
        title: const Text('Order', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSection(
              title: 'Your order',
              child: Column(
                children: [
                  _buildOrderItem(
                    pack: 'Pack 1',
                    meal: 'Chips dine',
                    items: '1 items',
                    price: '₦3,500',
                  ),
                  _buildOrderItem(
                    pack: 'Pack 2',
                    meal: 'Grilled Chicken with Jollof Rice',
                    items: '2 items',
                    price: '₦8,500',
                  ),
                ],
              ),
            ),
            _buildSection(
              title: 'Meal prep instructions',
              child: const Text('Please don\'t add onion to my food'),
            ),
            _buildSection(
              title: 'Summary',
              child: Column(
                children: [
                  _buildSummaryRow('Sub-item (2 items)', '₦13,500'),
                  _buildSummaryRow('Estimated time', 'Under 1 hour'),
                  _buildSummaryRow('Timestamp', '28/4/2025\n9:00 am'),
                  const Divider(),
                  _buildSummaryRow('Total', '₦13,500', isTotal: true),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildSupportSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ExpansionTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        initiallyExpanded: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem({required String pack, required String meal, required String items, required String price}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(pack, style: const TextStyle(fontWeight: FontWeight.w500)),
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(meal),
            subtitle: Text(items),
            trailing: Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String title, String amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
          Text(amount, style: TextStyle(fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }

  Widget _buildSupportSection() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'By clicking "Contact Macky\'s food support" you agree to Macky\'s food Terms of service and Cancellation policy.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 8),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.support_agent, color: Color(0xFF386641)),
              label: const Text('Contact Macky\'s food support', style: TextStyle(color: Color(0xFF386641))),
            ),
          ],
        ),
      ),
    );
  }
} 