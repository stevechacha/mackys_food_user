import 'package:flutter/material.dart';
import 'support_chat_screen.dart';

class CancelOrderScreen extends StatefulWidget {
  const CancelOrderScreen({Key? key}) : super(key: key);

  @override
  State<CancelOrderScreen> createState() => _CancelOrderScreenState();
}

class _CancelOrderScreenState extends State<CancelOrderScreen> {
  String? _selectedReason;
  final List<String> _reasons = [
    'Forgot an item',
    'Changed of mind',
    'Checkout to wrong address',
    'Accidentally ordered',
    'Others',
  ];
  final TextEditingController _otherReasonController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

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
        title: const Text('Cancel', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter your report details below, we are sorry about the inconvenience',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 16),
            _buildOrderSummary(),
            const SizedBox(height: 16),
            const Text('Reasons', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _reasons.map((reason) {
                final isSelected = _selectedReason == reason;
                return ChoiceChip(
                  label: Text(reason),
                  selected: isSelected,
                  selectedColor: const Color(0xFFdbead6),
                  labelStyle: TextStyle(color: isSelected ? const Color(0xFF386641) : Colors.black87, fontWeight: FontWeight.bold),
                  onSelected: (_) => setState(() => _selectedReason = reason),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Colors.grey.shade100,
                  side: BorderSide(color: isSelected ? const Color(0xFF386641) : Colors.grey.shade200),
                );
              }).toList(),
            ),
            if (_selectedReason == 'Others') ...[
              const SizedBox(height: 12),
              TextField(
                controller: _otherReasonController,
                decoration: const InputDecoration(
                  hintText: 'Please specify your reason',
                  border: OutlineInputBorder(),
                ),
                maxLines: 1,
              ),
            ],
            const SizedBox(height: 16),
            const Text('Description (Optional)', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(
                hintText: 'The food I checkout is wrong, I\'m sorry',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _selectedReason != null
                    ? () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const SupportChatScreen()),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF386641),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Submit', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ExpansionTile(
        title: const Text('Chef\'s Amaka', style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: const Text('4 items • ₦13,500'),
        initiallyExpanded: true,
        children: [
          _buildOrderItem('Grilled Chicken with Jollof Rice', '2 items', '₦8,500'),
          _buildOrderItem('Chips dine', '1 items', '₦3,500'),
        ],
      ),
    );
  }

  Widget _buildOrderItem(String meal, String items, String price) {
    return ListTile(
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
    );
  }
} 