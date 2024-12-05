import 'package:example/data/expanded_variant/lazy_expanded_data.dart';
import 'package:flutter/material.dart';
import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';

class MLazyExpandedScreen extends StatefulWidget {
  const MLazyExpandedScreen({super.key});

  @override
  State<MLazyExpandedScreen> createState() => _MExpandedScreenState();
}

class _MExpandedScreenState extends State<MLazyExpandedScreen> {
  late TreeType<EasyNodeType> _tree;
  bool isLoading = false;

  @override
  void initState() {
    _tree = createRoot();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("LazyExpandedWidget (multiple choice)"),
        ),
        body: Stack(
          children: [
            MLazyExpandedWidget(
              _tree,
              fGetChildrenFunc: fGetChildrenFunc,
            ),
            _buildLoading(),
          ],
        ),
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
