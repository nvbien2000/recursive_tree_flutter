/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 */

part of '../../../recursive_tree_flutter.dart';

class SLazyExpandedWidget<T extends AbsNodeType> extends StatefulWidget {
  const SLazyExpandedWidget(
    this.initData, {
    super.key,
    this.properties = const UIProperties(),
    required this.fGetChildrenFunc,
  });

  final TreeType<T> initData;
  final UIProperties<T> properties;
  final FGetChildrenFunc<T> fGetChildrenFunc;

  @override
  State<SLazyExpandedWidget<T>> createState() => _SLazyExpandedWidgetState<T>();
}

class _SLazyExpandedWidgetState<T extends AbsNodeType>
    extends State<SLazyExpandedWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (_, __) {
        return _SLazyEIWidget<T>(
          widget.initData,
          setStateEntireWidget: () => setState(() {}),
          properties: widget.properties,
          fGetChildrenFunc: widget.fGetChildrenFunc,
        );
      },
    );
  }
}
