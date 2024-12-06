/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 */

part of '../../../../recursive_tree_flutter.dart';

/// Single choice style: Internal widget of [MExpandedWidget].
class _SEIWidget<T extends AbsNodeType> extends StatefulWidget {
  const _SEIWidget(
    this.initData, {
    super.key,
    required this.setStateEntireWidget,
    this.properties = const UIProperties(),
  });

  final TreeType<T> initData;
  final UIProperties<T> properties;

  /// This is a [setState] callback function. It is used to update the entire
  /// widget. Example: You need to update field [isChosen] of all nodes.
  final VoidCallback setStateEntireWidget;

  @override
  State<_SEIWidget> createState() => _SEIWidgetState<T>();
}

class _SEIWidgetState<T extends AbsNodeType> extends State<_SEIWidget<T>>
    with SingleTickerProviderStateMixin, ExpandedWidgetMixin<T> {
  @override
  void onInit() {
    tree = widget.initData;
    rotationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    if (tree.data.isExpanded) {
      rotationController.forward();
    }
    properties = widget.properties;
  }

  @override
  void initState() {
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
    Widget trailing = const SizedBox.shrink();
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
                updateTreeSingleChoice(tree, value!);
                widget.setStateEntireWidget();
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

    Widget? leading = widget.properties.leadingWidget(tree);
    if (leading == null) {
      leading = RotationTransition(
        turns: turnsTween.animate(rotationController),
        child: tree.isLeaf
            ? SizedBox.shrink()
            : IconButton(
                iconSize: 16,
                icon: const Icon(Icons.expand_more, size: 16.0),
                onPressed: updateToggleExpansion,
              ),
      );
    }

    return InkWell(
      onTap: updateToggleExpansion,
      child: Row(
        children: [
          leading,
          //? Title
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Text(
                tree.data.title +
                    (tree.isLeaf ? "" : " (${tree.children.length})"),
                style: widget.properties.nodeTextStyle(tree),
                maxLines: widget.properties.nodeMaxLines,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          //? Check box
          trailing,
        ],
      ),
    );
  }

  @override
  List<Widget> genChildrenWidgets(children) {
    return List.generate(
      children.length,
      (i) => _SEIWidget(
        children[i],
        setStateEntireWidget: widget.setStateEntireWidget,
        properties: widget.properties,
      ),
    );
  }

  @override
  void updateToggleExpansion() => setState(() => toggleExpansion());
}
