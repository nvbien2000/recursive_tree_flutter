/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 */

part of '../../../recursive_tree_flutter.dart';

/// expanded internal widget
class _EIWidget<T extends AbsNodeType> extends StatefulWidget {
  const _EIWidget(
    this.initData, {
    super.key,
    required this.setStateEntireWidget,
    required this.properties,
  });

  final TreeType<T> initData;
  final UIProperties properties;

  /// This is a [setState] callback function. It is used to update the entire
  /// widget. Example: You need to update field [isChosen] of all nodes.
  final VoidCallback setStateEntireWidget;

  @override
  State<_EIWidget> createState() => _EIWidgetState<T>();
}

class _EIWidgetState<T extends AbsNodeType> extends State<_EIWidget<T>>
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
    return InkWell(
      onTap: updateToggleExpansion,
      child: Row(
        children: [
          //? Rotation icon
          RotationTransition(
            turns: turnsTween.animate(rotationController),
            child: tree.isLeaf
                ? SizedBox.shrink()
                : IconButton(
                    iconSize: 16,
                    icon: const Icon(Icons.expand_more, size: 16.0),
                    onPressed: updateToggleExpansion,
                  ),
          ),
          //? Title
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Text(
                tree.data.title +
                    (tree.isLeaf ? "" : " (${tree.children.length})"),
                maxLines: widget.properties.maxLines,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          //? Check box
          Checkbox(
            tristate: tree.isLeaf ? false : true,
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
                    tree.data.isChosen = value;
                    setState(() {
                      updateTreeMultipleChoice(tree, value);
                      widget.setStateEntireWidget();
                    });
                  },
          ),
        ],
      ),
    );
  }

  @override
  List<Widget> genChildrenWidgets(children) {
    return List.generate(
      children.length,
      (i) => _EIWidget(
        children[i],
        setStateEntireWidget: widget.setStateEntireWidget,
        properties: widget.properties,
      ),
    );
  }

  @override
  void updateToggleExpansion() => setState(() => toggleExpansion());
}
