import 'package:example/helpers/ex_traversal_func.dart';
import 'package:example/widgets/btn3.dart';
import 'package:flutter/material.dart';
import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';

import '../../models/ex.dart';
import '../../data/example_stack_data.dart';
import '../../widgets/btn2.dart';
import '../../widgets/divider.dart';

class ExStackScreen extends StatefulWidget {
  const ExStackScreen({super.key});

  @override
  State<ExStackScreen> createState() => _ExStackScreenState();
}

class _ExStackScreenState extends State<ExStackScreen> {
  late List<TreeType<EasyNodeType>> listTrees;
  final String searchingText = "3";

  @override
  void initState() {
    listTrees = sampleStackData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("StackWidget (multiple choice)")),
      body: SafeArea(
        child: Column(
          children: [
            divider,
            Expanded(
              child: StackWidget(
                listTrees,
                properties: const UIProperties(
                  title: "YOU REACH THE ROOTS",
                  titleStyle: TextStyle(
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
                  title: "Delete branch 3.4",
                  onTap: () {
                    var tree = findRoot(listTrees[0]);
                    var node3_4 = listTrees[0].children[1].children[0];
                    var id = node3_4.data.id;

                    try {
                      deleteBranchByID(tree, id);
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
