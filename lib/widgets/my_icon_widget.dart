import 'package:flutter/material.dart';

class MyIconWidget extends StatelessWidget {
  final VoidCallback function;
  final IconData icon;
  final Color backgroundColor;
  const MyIconWidget({
    super.key,
    required this.function,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: IconButton(
        onPressed: function,
        icon: Icon(icon, color: Colors.white),
      ),
    );
  }
}
