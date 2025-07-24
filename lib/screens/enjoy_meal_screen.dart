import 'package:flutter/material.dart';
import 'review_screen.dart';

class EnjoyMealScreen extends StatelessWidget {
  const EnjoyMealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('🙂', style: TextStyle(fontSize: 80)),
              const SizedBox(height: 24),
              const Text(
                'Enjoy your meal?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'We\'d love to hear about your experience with Chef & Pilot. Help share what you loved and how we can make it even better.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54, height: 1.5),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const ReviewScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF386641),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Leave review'),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF386641),
                  side: const BorderSide(color: Color(0xFF386641)),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Go back home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 