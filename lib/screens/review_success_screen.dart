import 'package:flutter/material.dart';
import 'order_screen.dart';
import 'dart:math';

class ReviewSuccessScreen extends StatelessWidget {
  const ReviewSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const _ConfettiBackground(),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFF386641),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text('m', style: TextStyle(fontSize: 56, color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Thank you, review have been submitted',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
        child: SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const OrderScreen()),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF386641),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Done', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}

class _ConfettiBackground extends StatelessWidget {
  const _ConfettiBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.red.shade300,
      Colors.green.shade300,
      Colors.blue.shade300,
      Colors.yellow.shade700,
      Colors.pink.shade200,
      Colors.purple.shade200,
    ];

    return Stack(
      children: List.generate(100, (index) {
        final size = Random().nextDouble() * 5 + 2;
        final top = Random().nextDouble() * MediaQuery.of(context).size.height;
        final left = Random().nextDouble() * MediaQuery.of(context).size.width;
        final color = colors[Random().nextInt(colors.length)];

        return Positioned(
          top: top,
          left: left,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        );
      }),
    );
  }
} 