import 'package:flutter/material.dart';
import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';

/// You can start with a list of children trees rather than
/// the root. If you want to start with root, you can pass the argument:
/// `listTrees = [root]`
class StackWidget<T extends AbsNodeType> extends StatefulWidget {
  const StackWidget(
    this.initData, {
    super.key,
    this.properties = const UIProperties(),
  });

  final UIProperties properties;
  final List<TreeType<T>> initData;

  @override
  State<StackWidget> createState() => _StackWidgetState<T>();
}

class _StackWidgetState<T extends AbsNodeType> extends State<StackWidget<T>> {
  late List<TreeType<T>> listTrees;

  @override
  void initState() {
    listTrees = widget.initData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (listTrees.isEmpty) {
      return widget.properties.emptyWidget;
    } else {
      return Column(
        children: [
          _buildTopTitle(),
          const SizedBox(height: 10),
          _buildMainView(),
        ],
      );
    }
  }

  //****************************************************
  //* BUILD UI
  //****************************************************

  Widget _buildTopTitle() {
    if (listTrees[0].parent == null) {
      return ListTile(
        leading: const SizedBox(),
        trailing: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.properties.title,
          textAlign: TextAlign.center,
          style: widget.properties.titleStyle,
          maxLines: widget.properties.titleMaxLines,
        ),
      );
    } else {
      return ListTile(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: _pressBackToParent,
        ),
        trailing: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          listTrees[0].parent!.data.title,
          style: widget.properties.titleStyle,
          textAlign: TextAlign.center,
          maxLines: widget.properties.titleMaxLines,
        ),
      );
    }
  }

  Widget _buildMainView() {
    return Expanded(
      child: ListView.separated(
        itemCount: listTrees.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (_, i) => _buildNodeWidget(listTrees[i]),
      ),
    );
  }

  Widget _buildNodeWidget(TreeType<T> tree) {
    final listTileOnTap = tree.isLeaf ? null : () => _pressGoToChild(tree);
    final title =
        tree.data.title + (tree.isLeaf ? "" : " (${tree.children.length})");
    final leading = widget.properties.leafLeadingWidget;
    final checkBoxTristate = tree.isLeaf ? false : true;

    return ListTile(
      onTap: listTileOnTap,
      title: Text(
        title,
        style: widget.properties.nodeTextStyle,
      ),
      leading: leading,
      trailing: Checkbox(
        tristate: checkBoxTristate,
        side: tree.data.isUnavailable
            ? const BorderSide(color: Colors.grey, width: 1.0)
            : BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
        value: tree.data.isUnavailable ? false : tree.data.isChosen,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        activeColor: tree.data.isUnavailable
            ? Colors.grey
            : Theme.of(context).primaryColor,
        onChanged: tree.data.isUnavailable
            ? null
            : (value) {
                setState(() => updateTreeMultipleChoice(tree, value));
              },
      ),
    );
  }

  //****************************************************
  //* PRESS FUNCTIONS
  //****************************************************

  void _pressBackToParent() {
    setState(() {
      var parent = listTrees[0].parent!;

      if (parent.isRoot) {
        listTrees = [parent];
      } else {
        var grandparents = parent.parent!;
        listTrees = grandparents.children;
      }
    });
  }

  void _pressGoToChild(TreeType<T> innerNode) {
    if (innerNode.children.isEmpty) return;
    setState(() => listTrees = innerNode.children);
  }
}
