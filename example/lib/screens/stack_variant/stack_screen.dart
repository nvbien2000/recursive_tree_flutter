import 'package:example/screens/stack_variant/multiple_choice/m_lazy_stack_screen.dart';
import 'package:example/screens/stack_variant/multiple_choice/m_stack_screen.dart';
import 'package:example/screens/stack_variant/single_choice/s_lazy_stack_screen.dart';
import 'package:example/screens/stack_variant/single_choice/s_stack_screen.dart';
import 'package:example/widgets/btn1.dart';
import 'package:example/widgets/divider.dart';
import 'package:flutter/material.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Multiple choice style",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            const Btn1(
              screen: MStackScreen(),
              title: "Normal\nData parsed 1 time",
            ),
            const SizedBox(height: 20),
            const Btn1(
              screen: MLazyStackScreen(),
              title: "Lazy\nData parsed run-time",
            ),
            const SizedBox(height: 20),
            divider,
            //? ************************************************************
            const SizedBox(height: 20),
            const Text(
              "Single choice style",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            const Btn1(
              screen: SStackScreen(),
              title: "Normal\nData parsed 1 time",
            ),
            const SizedBox(height: 20),
            const Btn1(
              screen: SLazyStackScreen(),
              title: "Lazy\nData parsed run-time",
            ),
          ],
        ),
      ),
    );
  }
}
