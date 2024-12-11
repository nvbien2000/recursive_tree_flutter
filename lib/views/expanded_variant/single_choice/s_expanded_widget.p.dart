/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 */

part of '../../../unit_tree_flutter.dart';

class SExpandedWidget<T extends AbsNodeType> extends StatefulWidget {
  const SExpandedWidget(
    this.initData, {
    super.key,
    this.properties = const UIProperties(),
  });

  final TreeType<T> initData;
  final UIProperties<T> properties;

  @override
  State<SExpandedWidget<T>> createState() => _SExpandedWidgetState<T>();
}

class _SExpandedWidgetState<T extends AbsNodeType>
    extends State<SExpandedWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (_, __) {
        return _SEIWidget<T>(
          widget.initData,
          setStateEntireWidget: () => setState(() {}),
          properties: widget.properties,
        );
      },
    );
  }
}
