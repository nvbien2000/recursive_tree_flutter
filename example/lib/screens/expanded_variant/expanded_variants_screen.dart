import 'package:example/screens/expanded_variant/multiple_choice/m_expanded_screen.dart';
import 'package:example/screens/expanded_variant/multiple_choice/m_lazy_expanded_screen.dart';
import 'package:example/screens/expanded_variant/single_choice/s_expanded_screen.dart';
import 'package:example/screens/expanded_variant/single_choice/s_lazy_expanded_screen.dart';
import 'package:example/widgets/btn1.dart';
import 'package:example/widgets/divider.dart';
import 'package:flutter/material.dart';

class ExpandedVariantsScreen extends StatefulWidget {
  const ExpandedVariantsScreen({super.key});

  @override
  State<ExpandedVariantsScreen> createState() => _ExpandedVariantsScreenState();
}

class _ExpandedVariantsScreenState extends State<ExpandedVariantsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Expanded variants")),
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
                    screen: MExpandedScreen(),
                    title: "Normal\nData parsed 1 time",
                  ),
                  const SizedBox(height: 20),
                  const Btn1(
                    screen: MLazyExpandedScreen(),
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
                    screen: SExpandedScreen(),
                    title: "Normal\nData parsed 1 time",
                  ),
                  const SizedBox(height: 20),
                  const Btn1(
                    screen: SLazyExpandedScreen(),
                    title: "Lazy\nData parsed run-time",
                  ),
                ],
              ),
            ),
            //? ************************************************************
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              color: Colors.yellow.withOpacity(0.2),
              child: const Text(
                "- Q: Can I deeply customize this variant for such specific UI?"
                "\n- A: Yes. You can use [ExpandedWidgetMixin], which specified"
                " necessary methods & guidelines to implement. [MExpandedWidget]"
                " is its implementation. It's short, don't hesitate to start.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
