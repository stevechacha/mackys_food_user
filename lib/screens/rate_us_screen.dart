import 'package:flutter/material.dart';

class RateUsScreen extends StatelessWidget {
  const RateUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Rate us', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.star, size: 64, color: Color(0xFF386641)),
            SizedBox(height: 24),
            Text('Coming soon!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('You will be able to rate us here.', style: TextStyle(color: Colors.black54)),
          ],
        ),
      ),
    );
  }
} 