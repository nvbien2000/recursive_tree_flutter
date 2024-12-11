import 'package:example/data/expanded_variant/lazy_expanded_data.dart';
import 'package:flutter/material.dart';
import 'package:unit_tree_flutter/unit_tree_flutter.dart';

class SLazyExpandedScreen extends StatefulWidget {
  const SLazyExpandedScreen({super.key});

  @override
  State<SLazyExpandedScreen> createState() => _MExpandedScreenState();
}

class _MExpandedScreenState extends State<SLazyExpandedScreen> {
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
          title: const Text("LazyExpandedWidget (single choice)"),
        ),
        body: Stack(
          children: [
            SLazyExpandedWidget(
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
