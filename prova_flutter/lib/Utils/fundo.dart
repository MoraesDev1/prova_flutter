import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Fundo extends StatelessWidget {
  Widget child;
  Fundo({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 25, 73, 105),
            Color.fromARGB(255, 20, 161, 152)
          ],
        ),
      ),
      child: child,
    );
  }
}
