/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 */

part of '../../recursive_tree_flutter.dart';

mixin ExpandedWidgetMixin<T extends AbsNodeType> {
  late AnimationController rotationController;
  final Tween<double> turnsTween = Tween<double>(begin: -0.25, end: 0.0);
  late UIProperties properties;

  late TreeType<T> tree;

  /// Init all necessary fields at `initState`, example:
  /// ```dart
  /// @override
  /// void onInit() {
  ///   tree = widget.initData;
  ///   rotationController = AnimationController(
  ///     duration: const Duration(milliseconds: 300),
  ///     vsync: this,
  ///   );
  ///   if (tree.data.isExpanded) {
  ///       rotationController.forward();
  ///   }
  ///   properties = widget.properties;
  /// }
  /// ```
  void onInit();

  void onDispose() {
    rotationController.dispose();
  }

  Widget buildView(BuildContext context) {
    if (!tree.data.isShowedInSearching) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildNode(context),
        buildChildrenNodes(context),
      ],
    );
  }

  Widget buildNode(BuildContext context);

  Widget buildChildrenNodes(BuildContext context) {
    if (tree.children.isEmpty) {
      return const SizedBox.shrink();
    }

    List<Widget> widgets = genChildrenWidgets(tree.children);

    return SizeTransition(
      sizeFactor: rotationController,
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: ListView.builder(
          physics: properties.ePhysics,
          shrinkWrap: true,
          itemCount: widgets.length,
          itemBuilder: (_, i) => widgets[i],
        ),
      ),
    );
  }

  /// Convert list of `TreeType<T>` into a list of widgets.
  /// Example:
  ///
  /// ```dart
  /// return List.generate(
  ///   children.length,
  ///   (int index) => _EIWidget<T>(children[index]),
  /// );
  /// ```
  List<Widget> genChildrenWidgets(List<TreeType<T>> children);

  void toggleExpansion() {
    tree.data.isExpanded = !tree.data.isExpanded;
    tree.data.isExpanded
        ? rotationController.forward()
        : rotationController.reverse();
  }

  /// Call `setState` to toggle expansion. Just:
  /// ```dart
  /// void updateStateToggleExpansion() => setState(() => toggleExpansion());
  /// ```
  void updateToggleExpansion();
}
