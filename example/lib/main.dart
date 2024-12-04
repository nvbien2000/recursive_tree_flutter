import 'package:flutter/material.dart';

import 'screens/expandable_multiple_choice/expanded_screen.dart';
import 'screens/expandable_single_choice/expandable_single_choice_screen.dart';
import 'screens/stack/stack_screen.dart';
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
              screen: StackScreen(),
              title: "Stack variants",
            ),
            divider,
            const Btn1(
              screen: ExpandedScreen(),
              title: "Expanded variants",
            ),
            divider,
            const Btn1(
              screen: ExpandableSingleChoiceScreen(),
              title: "Expanded - Single Choice variant",
            ),
            divider,
            InkWell(
              // onTap: () {},
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
