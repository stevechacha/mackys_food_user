import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String _reporting = 'Chef';
  String _reportType = 'Spoilt food';
  final TextEditingController _descriptionController = TextEditingController();
  String? _attachment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Report', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Who are you reporting?', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                ChoiceChip(
                  label: const Text('Chef'),
                  selected: _reporting == 'Chef',
                  onSelected: (selected) => setState(() => _reporting = 'Chef'),
                  selectedColor: const Color(0xFF386641),
                  labelStyle: TextStyle(color: _reporting == 'Chef' ? Colors.white : Colors.black),
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Pilot'),
                  selected: _reporting == 'Pilot',
                  onSelected: (selected) => setState(() => _reporting = 'Pilot'),
                  selectedColor: const Color(0xFF386641),
                  labelStyle: TextStyle(color: _reporting == 'Pilot' ? Colors.white : Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Report type', style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 8,
              children: [
                'Spoilt food', 'Bad meal', 'Wrong order', 'Late delivery'
              ].map((type) => ChoiceChip(
                label: Text(type),
                selected: _reportType == type,
                onSelected: (selected) => setState(() => _reportType = type),
                selectedColor: const Color(0xFF386641),
                labelStyle: TextStyle(color: _reportType == type ? Colors.white : Colors.black),
              )).toList(),
            ),
            const SizedBox(height: 16),
            const Text('Description (Optional)', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                hintText: 'The food I received is already spoilt, and it is really frustrating',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            const Text('Attachment (Optional)', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _attachment = 'assets/meal.jpg';
                    });
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: _attachment == null
                        ? const Icon(Icons.add_a_photo, color: Colors.grey)
                        : Image.asset(_attachment!, fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(width: 8),
                if (_attachment != null)
                  IconButton(
                    icon: const Icon(Icons.cancel, color: Colors.red),
                    onPressed: () => setState(() => _attachment = null),
                  ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF386641)),
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 