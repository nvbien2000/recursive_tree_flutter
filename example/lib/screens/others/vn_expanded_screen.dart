import 'package:example/models/vn_region_node.dart';
import 'package:flutter/material.dart';
import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';

class VnExpandedScreen extends StatefulWidget {
  const VnExpandedScreen(this.tree, {super.key});

  final TreeType<VNRegionNode> tree;

  @override
  State<VnExpandedScreen> createState() => _VnExpandedScreenState();
}

class _VnExpandedScreenState extends State<VnExpandedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose an unit"),
      ),
      body: SafeArea(
        child: SExpandedWidget(
          widget.tree,
          properties: UIProperties<VNRegionNode>(),
        ),
      ),
    );
  }
}
