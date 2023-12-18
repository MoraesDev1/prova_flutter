import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final bool obscureText;
  final Icon icon;
  final TextEditingController controller;
  const CustomTextField(
      {super.key,
      required this.obscureText,
      required this.icon,
      required this.controller});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.obscureText,
            cursorColor: const Color(0xff1e4e62),
            decoration: InputDecoration(
              prefixIcon: widget.icon,
              prefixIconColor: const Color(0xff1e4e62),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
