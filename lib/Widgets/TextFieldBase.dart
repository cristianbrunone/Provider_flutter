import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldBase extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  final IconData? icon;
  final bool obscureText;
  final double height;

  TextFieldBase(
    this.name,
    this.controller, {
    this.obscureText = false,
    this.icon,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      height: height > 0.5 ? height : 45,
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: TextFormField(
        controller: this.controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          icon: this.icon != null ? Icon(this.icon, color: Colors.blue) : null,
          hintText: this.name,
          border: InputBorder.none,
        ),
      ),
    );
  }
}