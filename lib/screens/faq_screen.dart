import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final List<Map<String, String>> _faqs = [
    {
      'question': 'How do I place an order?',
      'answer': 'Simply explore, browse the menu, add your meal to tray, and tap the “Place order” button.'
    },
    {
      'question': 'How do I add a new address?',
      'answer': 'Go to More > Location, tap “Add address”, and fill in your delivery details.'
    },
    {
      'question': 'How do I change my password?',
      'answer': 'Go to More > Change password, enter your new password, and confirm.'
    },
  ];
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final filteredFaqs = _faqs.where((faq) =>
      faq['question']!.toLowerCase().contains(_search.toLowerCase()) ||
      faq['answer']!.toLowerCase().contains(_search.toLowerCase())
    ).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Frequently asked questions', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Search frequently asked question',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (v) => setState(() => _search = v),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: filteredFaqs.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.help_outline, size: 64, color: Colors.grey.shade400),
                          const SizedBox(height: 16),
                          const Text('No results found', style: TextStyle(fontSize: 16, color: Colors.black54)),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredFaqs.length,
                      itemBuilder: (context, index) {
                        final faq = filteredFaqs[index];
                        return Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          child: ExpansionTile(
                            title: Text(faq['question']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(faq['answer']!),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
} 