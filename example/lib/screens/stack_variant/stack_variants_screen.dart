import 'package:example/screens/stack_variant/multiple_choice/m_lazy_stack_screen.dart';
import 'package:example/screens/stack_variant/multiple_choice/m_stack_screen.dart';
import 'package:example/screens/stack_variant/single_choice/s_lazy_stack_screen.dart';
import 'package:example/screens/stack_variant/single_choice/s_stack_screen.dart';
import 'package:example/widgets/btn1.dart';
import 'package:example/widgets/divider.dart';
import 'package:flutter/material.dart';

class StackVariantsScreen extends StatefulWidget {
  const StackVariantsScreen({super.key});

  @override
  State<StackVariantsScreen> createState() => _StackVariantsScreenState();
}

class _StackVariantsScreenState extends State<StackVariantsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stack variants")),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
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
            //? ************************************************************
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              color: Colors.blue.withOpacity(0.1),
              child: const Text(
                "- Q: Can I deeply customize this variant for such specific UI?"
                "\n- A: Yes. You can copy-paste and edit the widget as your wish. It's just about 200 lines of code, very easy to read.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
