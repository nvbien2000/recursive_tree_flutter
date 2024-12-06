import 'package:example/screens/others/vn_administrative_units.dart';
import 'package:flutter/material.dart';

import 'screens/expanded_variant/expanded_variants_screen.dart';
import 'screens/stack_variant/stack_variants_screen.dart';
import 'widgets/btn1.dart';
import 'widgets/divider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tree View Flutter Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Btn1(
              screen: StackVariantsScreen(),
              title: "Stack variants",
            ),
            divider,
            const Btn1(
              screen: ExpandedVariantsScreen(),
              title: "Expanded variants",
            ),
            divider,
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffda251d),
              ),
              width: 300,
              height: 300 / 1.618,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const OtherScreen()),
                    );
                  },
                  child: const Center(
                    child: Text(
                      "Administrative units\nVietnam",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xffffff00),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
