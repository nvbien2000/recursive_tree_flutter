import 'package:flutter/material.dart';

import '../../widgets/btn1.dart';
import 'ex_lazy_stack_screen.dart';
import 'ex_stack_screen.dart';

class StackScreen extends StatefulWidget {
  const StackScreen({super.key});

  @override
  State<StackScreen> createState() => _StackScreenState();
}

class _StackScreenState extends State<StackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stack variant")),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Btn1(
              screen: ExStackScreen(),
              title: "Multiple choice.\nParse data 1 time",
            ),
            SizedBox(height: 20),
            Btn1(
              screen: ExLazyStackScreen(),
              title: "Lazy multiple choice.\nParse data run-time",
            ),
          ],
        ),
      ),
    );
  }
}
