import 'package:flutter/material.dart';

class Btn1 extends StatelessWidget {
  final String title;
  final StatefulWidget screen;

  const Btn1({
    super.key,
    required this.screen,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => screen),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black, fontSize: 16),
      ),
    );
  }
}
