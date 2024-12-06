import 'package:example/helpers/ex_traversal_func.dart';
import 'package:example/widgets/btn2.dart';
import 'package:example/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';

import '../../../data/stack_variant/lazy_stack_data.dart';

class SLazyStackScreen extends StatefulWidget {
  const SLazyStackScreen({super.key});

  @override
  State<SLazyStackScreen> createState() => _SLazyStackScreenState();
}

class _SLazyStackScreenState extends State<SLazyStackScreen> {
  List<TreeType<EasyNodeType>> listTrees = [];
  bool isLoading = false;

  @override
  void initState() {
    listTrees = [createRoot()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LazyStackWidget (single choice)")),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                divider,
                Expanded(
                  child: SLazyStackWidget(
                    listTrees,
                    properties: const UIProperties(
                      stackTitle: "YOU REACH THE ROOTS",
                      stackTitleStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    fGetChildrenFunc: fGetChildrenFunc,
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
              ],
            ),
          ),
          _buildLoading(),
        ],
      ),
    );
  }

  Future<List<TreeType<EasyNodeType>>> fGetChildrenFunc(
      TreeType<EasyNodeType> parent) async {
    List<TreeType<EasyNodeType>> newChildren;
    String parentTitle = parent.data.title;

    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => isLoading = false);

    if (parentTitle.contains("0")) {
      newChildren = createChildrenOfRoot(parent);
    } else if (parentTitle.contains("1.1")) {
      newChildren = createChildrenOfLv1_1(parent);
    } else if (parentTitle.contains("2.1")) {
      newChildren = createChildrenOfLv2_1(parent);
    } else if (parentTitle.contains("2.2")) {
      newChildren = createChildrenOfLv2_2(parent);
    } else {
      newChildren = [];
    }

    return newChildren;
  }

  Widget _buildLoading() {
    if (isLoading) {
      return Container(
        color: Colors.black.withOpacity(0.3),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
