import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  Mybutton({required this.title, required this.color, required this.onPressed});
  final Color color;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: color,
        child: MaterialButton(
          minWidth: 200,
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
