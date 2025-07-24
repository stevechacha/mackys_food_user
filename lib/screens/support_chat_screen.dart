import 'package:flutter/material.dart';

class SupportChatScreen extends StatelessWidget {
  const SupportChatScreen({Key? key}) : super(key: key);

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
        title: const Text('Support', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildChatMessage(
                  'No rush though—we still have to wait for Lana\'s designs.',
                  isMe: false,
                  time: 'Thursday 11:44am',
                ),
                _buildChatMessage(
                  'Awesome! Thanks, I\'ll look at this today.',
                  isMe: true,
                  time: 'Thursday 11:47am',
                ),
                _buildChatMessage(
                  'Hey Olivia, can you please review the latest design when you can?',
                  isMe: false,
                  time: 'Today 11:44am',
                ),
                _buildChatMessage(
                  'Sure thing, I\'ll have a look today. They\'re looking great!',
                  isMe: true,
                  time: 'Just now',
                ),
              ],
            ),
          ),
          _buildMessageComposer(),
        ],
      ),
    );
  }

  Widget _buildChatMessage(String text, {required bool isMe, required String time}) {
    return Column(
      crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isMe ? const Color(0xFF386641) : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            text,
            style: TextStyle(color: isMe ? Colors.white : Colors.black),
          ),
        ),
        const SizedBox(height: 4),
        Text(time, style: const TextStyle(color: Colors.black54, fontSize: 12)),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildMessageComposer() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.white,
      child: Row(
        children: [
          IconButton(icon: const Icon(Icons.attach_file), onPressed: () {}),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Write a message...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Color(0xFF386641)),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
} 