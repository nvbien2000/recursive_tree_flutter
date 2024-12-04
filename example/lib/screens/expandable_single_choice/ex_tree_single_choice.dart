import 'package:flutter/material.dart';
import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';

import '../../data/example_vts_department_data.dart';

class ExTreeSingleChoice extends StatefulWidget {
  const ExTreeSingleChoice({super.key});

  @override
  State<ExTreeSingleChoice> createState() => _ExTreeSingleChoiceState();
}

class _ExTreeSingleChoiceState extends State<ExTreeSingleChoice> {
  late TreeType<EasyNodeType> _tree;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    _tree = sampleTree();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Example Single Choice Expandable Tree"),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: _VTSNodeWidget(
                  _tree,
                  onNodeDataChanged: () => setState(() {}),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: TextFormField(
                controller: _textController,
                decoration: const InputDecoration(
                  hintText: "PRESS ENTER TO UPDATE",
                ),
                onFieldSubmitted: (value) {
                  updateTreeWithSearchingTitle(_tree, value);
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//? ____________________________________________________________________________

class _VTSNodeWidget extends StatefulWidget {
  const _VTSNodeWidget(
    this.tree, {
    required this.onNodeDataChanged,
  });

  final TreeType<EasyNodeType> tree;

  /// IMPORTANT: Because this library **DOESN'T** use any state management
  /// library, therefore I need to use call back function like this - although
  /// it is more readable if using `Provider`.
  final VoidCallback onNodeDataChanged;

  @override
  State<_VTSNodeWidget> createState() => _VTSNodeWidgetState();
}

class _VTSNodeWidgetState<T extends AbsNodeType> extends State<_VTSNodeWidget>
    with SingleTickerProviderStateMixin, ExpandedWidgetMixin<EasyNodeType> {
  @override
  void onInit() {
    tree = widget.tree;
    rotationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    if (tree.data.isExpanded) {
      rotationController.forward();
    }
  }

  @override
  initState() {
    super.initState();
    onInit();
  }

  @override
  void dispose() {
    onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => buildView(context);

  @override
  Widget buildNode(BuildContext context) {
    if (!widget.tree.data.isShowedInSearching) return const SizedBox.shrink();

    return InkWell(
      onTap: updateToggleExpansion,
      child: Row(
        children: [
          buildRotationIcon(),
          Expanded(child: buildTitle()),
          buildTrailing(),
        ],
      ),
    );
  }

  //* __________________________________________________________________________

  Widget buildRotationIcon() {
    return RotationTransition(
      turns: turnsTween.animate(rotationController),
      child: tree.isLeaf
          ? Container()
          : IconButton(
              iconSize: 16,
              icon: const Icon(Icons.expand_more, size: 16.0),
              onPressed: updateToggleExpansion,
            ),
    );
  }

  Widget buildTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Text(
        tree.data.title + (tree.isLeaf ? "" : " (${tree.children.length})"),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget buildTrailing() {
    if (tree.data.isUnavailable) {
      return const Icon(Icons.close_rounded, color: Colors.red);
    }

    if (tree.isLeaf) {
      return Checkbox(
        value: tree.data.isChosen!, // leaves always is true or false
        onChanged: (value) {
          updateTreeSingleChoice(tree, !tree.data.isChosen!);
          widget.onNodeDataChanged();
        },
      );
    }

    return const SizedBox.shrink();
  }

  //* __________________________________________________________________________

  @override
  List<Widget> genChildrenWidgets(List<TreeType<EasyNodeType>> list) =>
      List.generate(
        list.length,
        (int index) => _VTSNodeWidget(
          list[index],
          onNodeDataChanged: widget.onNodeDataChanged,
        ),
      );

  @override
  void updateToggleExpansion() => setState(() => toggleExpansion());
}