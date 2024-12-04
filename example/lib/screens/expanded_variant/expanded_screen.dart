import 'package:flutter/material.dart';

import '../../widgets/btn1.dart';
import 'ex_expanded_screen.dart';
import 'ex_expanded_tree_screen.dart';

class ExpandedScreen extends StatefulWidget {
  const ExpandedScreen({super.key});

  @override
  State<ExpandedScreen> createState() => _ExpandedScreenState();
}

class _ExpandedScreenState extends State<ExpandedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expandable Multiple Choice"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Btn1(
              screen: ExExpandableTreeScreen(),
              title: "Expandable Tree\nmultiple choice - parse data 1 time",
            ),
            SizedBox(height: 20),
            Btn1(
              screen: ExExpandableTreeExpandedScreen(),
              title:
                  "Expandable Tree expands first\nmultiple choice - parse data 1 time",
            ),
          ],
        ),
      ),
    );
  }
}
