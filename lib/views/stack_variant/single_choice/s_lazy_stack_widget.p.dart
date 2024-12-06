/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 */

part of '../../../recursive_tree_flutter.dart';

class SLazyStackWidget<T extends AbsNodeType> extends StatefulWidget {
  const SLazyStackWidget(
    this.initData, {
    super.key,
    this.properties = const UIProperties(),
    required this.fGetChildrenFunc,
  });

  final List<TreeType<T>> initData;
  final UIProperties properties;

  /// If this function not null, data was parsed to tree only 1 time; else
  /// data was parsed in run-time (lazy-loading).
  final FGetChildrenFunc<T> fGetChildrenFunc;

  @override
  State<SLazyStackWidget> createState() => _SLazyStackWidgetState<T>();
}

class _SLazyStackWidgetState<T extends AbsNodeType>
    extends State<SLazyStackWidget<T>> {
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
    final listTileOnTap = tree.isLeaf ? null : () => _pressInnerNode(tree);

    var title = tree.data.title;
    if (!tree.isLeaf) {
      if (tree.isChildrenLoadedLazily) {
        title += " (${tree.children.length})";
      } else {
        title += " (...)";
      }
    }

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
                setState(() => updateTreeSingleChoice(
                      tree,
                      value!,
                    ));
              },
      );
    } else {
      // inner node trailing is null or an arrow, based on its state
      if (tree.data.isChosen == null) {
        trailing = Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.green,
        );
      }
    }

    return ListTile(
      onTap: listTileOnTap,
      title: Text(
        title,
        style: widget.properties.nodeTextStyle(tree),
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

  Future<void> _pressInnerNode(TreeType<T> innerNode) async {
    /// children were loaded before -> just return
    if (innerNode.isChildrenLoadedLazily) {
      if (innerNode.children.isEmpty) return;
      setState(() => listTrees = innerNode.children);
      return;
    }

    /// mark current tree with [isChildrenLoadedLazily] = true
    var newChildren = await widget.fGetChildrenFunc(innerNode);
    innerNode.isChildrenLoadedLazily = true;

    /// if inner node has no children, mark it as unavailable & not chosen,
    /// then update tree and -> `return`
    if (newChildren.isEmpty) {
      var snackBar = const SnackBar(content: Text("This one has no children"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        innerNode.data.isUnavailable = true;
        innerNode.data.isChosen = false;
        updateTreeMultipleChoice(
          innerNode,
          false,
          isThisLazyTree: true,
        );
      });
      return;
    }

    /// else, update new children's `isChosen` properties in case of current
    /// tree has `isChosen = true`, then continue call stack
    if (innerNode.data.isChosen == true) {
      for (var e in newChildren) {
        if (!e.data.isUnavailable) e.data.isChosen = true;
      }
    }
    innerNode.children.addAll(newChildren);
    setState(() => listTrees = newChildren);
  }
}
