/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 */

part of '../../../recursive_tree_flutter.dart';

class MLazyExpandedWidget<T extends AbsNodeType> extends StatefulWidget {
  const MLazyExpandedWidget(
    this.initData, {
    super.key,
    this.properties = const UIProperties(),
    required this.fGetChildrenFunc,
  });

  final TreeType<T> initData;
  final UIProperties<T> properties;
  final FGetChildrenFunc<T> fGetChildrenFunc;

  @override
  State<MLazyExpandedWidget<T>> createState() => _MLazyExpandedWidgetState<T>();
}

class _MLazyExpandedWidgetState<T extends AbsNodeType>
    extends State<MLazyExpandedWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (_, __) {
        return _MLazyEIWidget<T>(
          widget.initData,
          setStateEntireWidget: () => setState(() {}),
          properties: widget.properties,
          fGetChildrenFunc: widget.fGetChildrenFunc,
        );
      },
    );
  }
}
