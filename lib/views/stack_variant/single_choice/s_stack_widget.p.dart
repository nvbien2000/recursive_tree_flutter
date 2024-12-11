/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 */

part of '../../../unit_tree_flutter.dart';

/// You can start with a list of children trees rather than
/// the root. If you want to start with root, you can pass the argument:
/// `listTrees = [root]`
class SStackWidget<T extends AbsNodeType> extends StatefulWidget {
  const SStackWidget(
    this.initData, {
    super.key,
    this.properties = const UIProperties(),
  });

  final List<TreeType<T>> initData;
  final UIProperties properties;

  @override
  State<SStackWidget> createState() => _SStackWidgetState<T>();
}

class _SStackWidgetState<T extends AbsNodeType> extends State<SStackWidget<T>> {
  late List<TreeType<T>> listTrees;

  @override
  void initState() {
    listTrees = widget.initData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (listTrees.isEmpty) {
      return widget.properties.stackEmptyWidget;
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
    Widget leading;
    String title;

    if (listTrees[0].isRoot) {
      leading = const SizedBox();
      title = widget.properties.stackTitle;
    } else {
      leading = IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: _pressBackToParent,
      );
      title = listTrees[0].parent!.data.title;
    }

    return ListTile(
      leading: leading,
      trailing: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: widget.properties.stackTitleStyle,
        maxLines: widget.properties.stackTitleMaxLines,
      ),
    );
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

    final leading = widget.properties.leadingWidget(tree);

    Widget? trailing;
    if (tree.isLeaf) {
      // leaf trailing is a checkbox
      trailing = Checkbox(
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
                setState(() => updateTreeSingleChoice(tree, value!));
              },
      );
    } else {
      // inner node trailing is null or an arrow, based on its state
      if (tree.data.isChosen == null) {
        trailing = Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Theme.of(context).primaryColor,
            size: 16,
          ),
        );
      }
    }

    return ListTile(
      onTap: listTileOnTap,
      title: Text(
        title,
        style: widget.properties.nodeTextStyle(tree),
        maxLines: widget.properties.nodeMaxLines,
      ),
      leading: leading,
      trailing: trailing,
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
