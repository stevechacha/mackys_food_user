import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'order_screen.dart';
import 'signup_success_screen.dart';

class OrderPreparationScreen extends StatefulWidget {
  const OrderPreparationScreen({Key? key}) : super(key: key);

  @override
  State<OrderPreparationScreen> createState() => _OrderPreparationScreenState();
}

class _OrderPreparationScreenState extends State<OrderPreparationScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const OrderScreen()),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const _ConfettiBackground(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFFdbead6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Icons.restaurant_menu, size: 48, color: Color(0xFF386641)),
                ),
                const SizedBox(height: 32),
                const Text(
                  "We're getting your order ready",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
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