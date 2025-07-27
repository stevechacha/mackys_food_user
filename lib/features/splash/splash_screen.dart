import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(child: SizedBox()),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    'm',
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF386641),
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: CustomPaint(
                      size: const Size(32, 10), // Smaller, more subtle smile
                      painter: _SmilePainter(width: 32, height: 10, strokeWidth: 3),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "macky",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF386641),
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        Text(
                          "'s",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF386641),
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    ),
                    // Smile under the 'm' in 'macky'
                    Positioned(
                      left: 0, // Directly under the 'm'
                      bottom: -2,
                      child: SizedBox(
                        width: 18,
                        height: 8,
                        child: CustomPaint(
                          painter: _SmilePainter(width: 18, height: 8, strokeWidth: 2.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SmilePainter extends CustomPainter {
  final double width;
  final double height;
  final double strokeWidth;
  _SmilePainter({this.width = 40, this.height = 16, this.strokeWidth = 4});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFD32F2F)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    final rect = Rect.fromLTWH(0, 0, width, height);
    canvas.drawArc(rect, 0, 3.14, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
