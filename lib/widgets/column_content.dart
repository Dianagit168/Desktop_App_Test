import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ColoumnContent extends StatelessWidget {
  final String content;
  final String title;
  const ColoumnContent({super.key, required this.content, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          content,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
