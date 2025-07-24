import 'package:flutter/material.dart';
import 'support_chat_screen.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  bool _startConversation = false;
  final TextEditingController _inputController = TextEditingController();

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
        title: const Text('Support', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: !_startConversation ? _buildWelcome() : _buildStartConversation(),
    );
  }

  Widget _buildWelcome() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF386641),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Image.asset('assets/images/logo.png', width: 24, height: 24, color: Colors.white),
                ),
              ),
              const SizedBox(width: 12),
              const Text('Macky\'s food', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              "Hello! we're here to help and will be with you shortly",
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => setState(() => _startConversation = true),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF386641),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Start conversation', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStartConversation() {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFFdbead6),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.chat_bubble_outline, color: Color(0xFF386641), size: 32),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Welcome to Macky\'s Food support',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Need help with your order or have a question? Start a conversation, and we\'ll be glad to assist!',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black87, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _inputController,
                  decoration: const InputDecoration(
                    hintText: 'Write a message...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                height: 48,
                width: 48,
                child: ElevatedButton(
                  onPressed: _inputController.text.trim().isNotEmpty
                      ? () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const SupportChatScreen()),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF386641),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.zero,
                  ),
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
} 