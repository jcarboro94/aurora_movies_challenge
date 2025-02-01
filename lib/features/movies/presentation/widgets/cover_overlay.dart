import 'package:flutter/material.dart';

class CoverOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: OverlayPainter(),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.transparent, // Transparent background to overlay properly
      ),
    );
  }
}

class OverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.orange.withOpacity(0.5),
          Colors.deepOrange.withOpacity(0.3),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    // Draw the base background
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    // Paint the glowing curved bands
    final Paint glowPaint = Paint()
      ..shader = RadialGradient(
        center: Alignment.topCenter,
        radius: 2,
        colors: [Colors.white.withOpacity(0.8), Colors.orange.withOpacity(0.4), Colors.transparent],
        stops: [0.1, 0.3, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 20);

    final Path curvedPath = Path()
      ..moveTo(0, size.height * 0.2)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.05, size.width, size.height * 0.2)
      ..lineTo(size.width, size.height * 0.4)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.3, 0, size.height * 0.4)
      ..close();

    final Path lowerCurvedPath = Path()
      ..moveTo(0, size.height * 0.7)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.85, size.width, size.height * 0.7)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    // Draw the glowing curved paths
    canvas.drawPath(curvedPath, glowPaint);
    canvas.drawPath(lowerCurvedPath, glowPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
