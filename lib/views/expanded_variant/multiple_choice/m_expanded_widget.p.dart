/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 */

part of '../../../recursive_tree_flutter.dart';

class MExpandedWidget<T extends AbsNodeType> extends StatefulWidget {
  const MExpandedWidget(
    this.initData, {
    super.key,
    this.properties = const UIProperties(),
  });

  final TreeType<T> initData;
  final UIProperties properties;

  @override
  State<MExpandedWidget<T>> createState() => _MExpandedWidgetState<T>();
}

class _MExpandedWidgetState<T extends AbsNodeType>
    extends State<MExpandedWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (_, __) {
        return _MEIWidget<T>(
          widget.initData,
          setStateEntireWidget: () => setState(() {}),
          properties: widget.properties,
        );
      },
    );
  }
}
