import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const GradientText({
    Key? key,
    required this.text,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          Color(0xFFEFA058), // Start color
          Color(0xFFEF5858), // End color
        ],
        stops: [0.0, 0.4717], // Figma gradient stops
      ).createShader(
        Rect.fromLTWH(0.0, 0.0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: style.copyWith(
            color:
                Colors.white), // White is a placeholder, masked by the gradient
      ),
    );
  }
}
