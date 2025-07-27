import 'package:flutter/material.dart';
import 'review_success_screen.dart';
import 'dart:math';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  int _chefRating = 0;
  int _pilotRating = 0;
  bool _showReview = false;
  final TextEditingController _chefDescController = TextEditingController();
  final TextEditingController _pilotDescController = TextEditingController();

  String _getEmojiForRating(int rating) {
    switch (rating) {
      case 1:
        return '😠';
      case 2:
        return '😟';
      case 3:
        return '😐';
      case 4:
        return '🙂';
      case 5:
        return '😍';
      default:
        return '😐';
    }
  }

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
        title: const Text('Review', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: !_showReview ? _buildPreReview() : _buildReviewForm(),
    );
  }

  Widget _buildPreReview() {
    return Stack(
      children: [
        const _ConfettiBackground(),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('😐', style: TextStyle(fontSize: 64, color: Colors.grey.shade700)),
                const SizedBox(height: 32),
                const Text(
                  'Enjoy your meal?',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  "We'd love to hear about your experience with Chef & Pilot! Share what you loved, or how we can make it even better...",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => setState(() => _showReview = true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF386641),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Leave review', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF386641)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Go back home', style: TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildReviewSection(
            title: "Chef's review",
            subtitle: 'Chef Amake',
            rating: _chefRating,
            onRatingChanged: (rating) {
              setState(() {
                _chefRating = rating;
              });
            },
            descController: _chefDescController,
          ),
          const SizedBox(height: 24),
          _buildReviewSection(
            title: "Pilot's review",
            subtitle: 'Pilot Jimoh',
            rating: _pilotRating,
            onRatingChanged: (rating) {
              setState(() {
                _pilotRating = rating;
              });
            },
            descController: _pilotDescController,
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (_chefRating > 0 && _pilotRating > 0)
                  ? () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const ReviewSuccessScreen()),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF386641),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Submit review', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewSection({
    required String title,
    required String subtitle,
    required int rating,
    required ValueChanged<int> onRatingChanged,
    required TextEditingController descController,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ExpansionTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        initiallyExpanded: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(_getEmojiForRating(rating), style: const TextStyle(fontSize: 48)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return IconButton(
                      icon: Icon(
                        index < rating ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 32,
                      ),
                      onPressed: () {
                        onRatingChanged(index + 1);
                      },
                    );
                  }),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: descController,
                  decoration: const InputDecoration(
                    labelText: 'Description (Optional)',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
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