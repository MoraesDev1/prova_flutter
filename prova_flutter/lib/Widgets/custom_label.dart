import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomLabel extends StatelessWidget {
  String label;
  CustomLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 10),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
