import 'package:flutter/material.dart';
import 'package:prova_flutter/Pages/login_page.dart';

void main() {
  runApp(
    MaterialApp(
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
    ),
  );
}
