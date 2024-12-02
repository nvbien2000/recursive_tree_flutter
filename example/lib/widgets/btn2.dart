import 'package:flutter/material.dart';

class Btn2 extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const Btn2({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      onPressed: onTap,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black, fontSize: 14),
          maxLines: 1,
        ),
      ),
    );
  }
}
