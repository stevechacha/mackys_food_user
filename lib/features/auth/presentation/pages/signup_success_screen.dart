import 'package:flutter/material.dart';
import 'dart:math';
import '../../../dashboard/dashboard_screen.dart';

class SignupSuccessScreen extends StatefulWidget {
  const SignupSuccessScreen({Key? key}) : super(key: key);

  @override
  State<SignupSuccessScreen> createState() => _SignupSuccessScreenState();
}

class _SignupSuccessScreenState extends State<SignupSuccessScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const DashboardScreen()),
          (route) => false,
        );
      }
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
                _LogoBag(),
                const SizedBox(height: 24),
                const Text(
                  "Let's get started!\nYour next meal is just a tap away",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LogoBag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: const Color(0xFF386641),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          'assets/images/logo.png', // Make sure you have this asset
          width: 70,
          height: 70,
          color: Colors.white,
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