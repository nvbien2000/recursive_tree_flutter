import 'package:example/helpers/ex_traversal_func.dart';
import 'package:example/widgets/btn3.dart';
import 'package:flutter/material.dart';
import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';

import '../../../models/ex.dart';
import '../../../data/stack_variant/stack_data.dart';
import '../../../widgets/btn2.dart';
import '../../../widgets/divider.dart';

class SStackScreen extends StatefulWidget {
  const SStackScreen({super.key});

  @override
  State<SStackScreen> createState() => _SStackScreenState();
}

class _SStackScreenState extends State<SStackScreen> {
  late List<TreeType<EasyNodeType>> listTrees;

  @override
  void initState() {
    listTrees = sampleStackData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("StackWidget (single choice)")),
      body: SafeArea(
        child: Column(
          children: [
            divider,
            Expanded(
              child: SStackWidget(
                listTrees,
                properties: const UIProperties(
                  stackTitle: "YOU REACH THE ROOTS",
                  stackTitleStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            divider,
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              children: [
                Btn2(
                  title: "Chosen leaves",
                  onTap: () => chosenLeaves(context, listTrees[0]),
                ),
                Btn2(
                  title: "Chosen nodes",
                  onTap: () => chosenNodes(context, listTrees[0]),
                ),
                Btn2(
                  title: "Search leaves contain \"2\"",
                  onTap: () => searchLeaves(context, "2", listTrees[0]),
                ),
                Btn2(
                  title: "Search nodes contain \"2\"",
                  onTap: () => searchNodes(context, "2", listTrees[0]),
                ),
              ],
            ),
            divider,
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              children: [
                Btn3(
                  title: "Insert leaf to root",
                  onTap: () {
                    var root = findRoot(listTrees[0]);
                    var newLeaf = Ex.sampleRandomLeaf();

                    try {
                      insertNode(root, newLeaf);
                      setState(() {});
                    } catch (e) {
                      debugPrint(e.toString());
                    }
                  },
                ),
                Btn3(
                  title: "Insert inner node to 1.2",
                  onTap: () {
                    var node1_2 = listTrees[1];
                    var newNode = Ex.sampleRandomInner();

                    try {
                      insertNode(node1_2, newNode);
                      setState(() {});
                    } catch (e) {
                      debugPrint(e.toString());
                    }
                  },
                ),
                Btn3(
                  title: "Delete tree with id=34",
                  onTap: () {
                    var root = findRoot(listTrees[0]);

                    try {
                      deleteBranchByID(root, 34);
                      setState(() {});
                    } catch (e) {
                      debugPrint(e.toString());
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
