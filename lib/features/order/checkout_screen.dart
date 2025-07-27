import 'package:flutter/material.dart';
import '../payment/payment_processing_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _paymentMethod = 'Wallet';
  bool _instructionsExpanded = false;
  final TextEditingController _instructionsController = TextEditingController();
  bool _editingContact = false;
  final TextEditingController _contactController = TextEditingController(text: '8133887495');
  String _address = 'Sikun 124, P.O.W Mafemi Crescent, Abuja, Nigeria';
  bool _editingAddress = false;
  final TextEditingController _addressController = TextEditingController();

  // Demo tray data
  final List<Map<String, dynamic>> _packs = [
    {
      'items': [
        {
          'image': 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
          'name': 'Chips dine',
          'qty': 1,
          'price': '₦3,500',
        },
        {
          'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
          'name': 'Grilled Chicken with Jollof Rice',
          'qty': 1,
          'price': '₦5,500',
        },
      ],
    },
    {
      'items': [
        {
          'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
          'name': 'Grilled Chicken with Jollof Rice',
          'qty': 2,
          'price': '₦3,500',
        },
      ],
    },
  ];

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
        title: const Text('Checkout', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const Text('Your tray', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            _buildChefTray(),
            const SizedBox(height: 16),
            _buildInstructionsSection(),
            const SizedBox(height: 16),
            _buildDeliveryDetails(),
            const SizedBox(height: 16),
            _buildSummarySection(),
            const SizedBox(height: 16),
            _buildPaymentSection(),
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const PaymentProcessingScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF386641),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Place order', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  Widget _buildChefTray() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.shade200)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 16, backgroundColor: Colors.grey.shade200, child: Icon(Icons.person, color: Colors.grey.shade400)),
                const SizedBox(width: 8),
                const Text("Chef's Amake", style: TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                Text(' ${_packs.fold<int>(0, (sum, p) => sum + (p['items'] as List).length)} items', style: const TextStyle(color: Colors.black54)),
                const SizedBox(width: 8),
                Text('₦13,500', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),
            ...List.generate(_packs.length, (i) {
              final pack = _packs[i];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Pack ${i + 1}', style: const TextStyle(fontWeight: FontWeight.w500)),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Add to pack', style: TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.bold)),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline, color: Colors.grey),
                        onPressed: () {},
                        tooltip: 'Remove pack',
                      ),
                    ],
                  ),
                  ...List.generate((pack['items'] as List).length, (j) {
                    final item = (pack['items'] as List)[j];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(item['image'] as String, width: 56, height: 56, fit: BoxFit.cover),
                          ),
                          const SizedBox(width: 12),
                          Expanded(child: Text(item['name'] as String, style: const TextStyle(fontWeight: FontWeight.w500))),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline, color: Color(0xFF386641)),
                                onPressed: () {},
                              ),
                              Container(
                                width: 32,
                                alignment: Alignment.center,
                                child: Text('${item['qty']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_circle_outline, color: Color(0xFF386641)),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          const SizedBox(width: 8),
                          Text(item['price'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    );
                  }),
                  if (i == _packs.length - 1)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: const [
                            Icon(Icons.add, color: Color(0xFF386641), size: 20),
                            SizedBox(width: 4),
                            Text('Add another pack', style: TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(height: 8),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionsSection() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.shade200)),
      child: ExpansionTile(
        initiallyExpanded: _instructionsExpanded,
        onExpansionChanged: (v) => setState(() => _instructionsExpanded = v),
        title: const Text('Leave a meal prep instructions', style: TextStyle(fontWeight: FontWeight.bold)),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Message', style: TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                TextField(
                  controller: _instructionsController,
                  decoration: const InputDecoration(
                    hintText: 'If you have any allergic please include them',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF386641)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                    child: const Text('Save', style: TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryDetails() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.shade200)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('Delivery details', style: TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                TextButton(
                  onPressed: () => setState(() => _editingAddress = !_editingAddress),
                  child: Text(_editingAddress ? 'Cancel' : 'Change address', style: const TextStyle(color: Color(0xFF386641))),
                ),
              ],
            ),
            _editingAddress
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _addressController,
                        decoration: const InputDecoration(hintText: 'Enter address'),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              _address = _addressController.text;
                              _editingAddress = false;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFF386641)),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                          ),
                          child: const Text('Save', style: TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      const Icon(Icons.location_on_outlined, color: Color(0xFF386641)),
                      const SizedBox(width: 12),
                      Expanded(child: Text(_address)),
                    ],
                  ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text('Contact', style: TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                TextButton(
                  onPressed: () => setState(() => _editingContact = !_editingContact),
                  child: Text(_editingContact ? 'Cancel' : 'Edit', style: const TextStyle(color: Color(0xFF386641))),
                ),
              ],
            ),
            _editingContact
                ? Row(
                    children: [
                      const Text('+234', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _contactController,
                          decoration: const InputDecoration(hintText: 'Contact number'),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.check, color: Color(0xFF386641)),
                        onPressed: () => setState(() => _editingContact = false),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      const Icon(Icons.phone_outlined, color: Color(0xFF386641)),
                      const SizedBox(width: 12),
                      const Text('+234', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 8),
                      Text(_contactController.text),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummarySection() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.shade200)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Summary', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _buildSummaryRow('Sub-item (2 items)', '₦13,500'),
            _buildSummaryRow('Delivery fee', '₦500'),
            _buildSummaryRow('Services fee', 'Free'),
            _buildSummaryRow('Estimated time', 'Under 1 hour'),
            const Divider(),
            _buildSummaryRow('Total', '₦14,000', isTotal: true),
          ],
        ),
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

  Widget _buildPaymentSection() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.shade200)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Payment method', style: TextStyle(fontWeight: FontWeight.bold)),
            RadioListTile<String>(
              title: const Text('Wallet'),
              subtitle: const Text('₦1,000'),
              value: 'Wallet',
              groupValue: _paymentMethod,
              onChanged: (value) => setState(() => _paymentMethod = value!),
              activeColor: const Color(0xFF386641),
            ),
            RadioListTile<String>(
              title: const Text('Bank transfer'),
              subtitle: const Text('Pay instantly via your bank app'),
              value: 'Bank transfer',
              groupValue: _paymentMethod,
              onChanged: (value) => setState(() => _paymentMethod = value!),
              activeColor: const Color(0xFF386641),
            ),
          ],
        ),
      ),
    );
  }
} 