/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 */

part of '../../recursive_tree_flutter.dart';

class ExpandedWidget<T extends AbsNodeType> extends StatefulWidget {
  const ExpandedWidget(
    this.initData, {
    super.key,
    this.properties = const UIProperties(),
  });

  final TreeType<T> initData;
  final UIProperties properties;

  @override
  State<ExpandedWidget<T>> createState() => _ExpandedWidgetState<T>();
}

class _ExpandedWidgetState<T extends AbsNodeType>
    extends State<ExpandedWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (_, __) {
        return _EIWidget<T>(
          widget.initData,
          setStateEntireWidget: () => setState(() {}),
          properties: widget.properties,
        );
      },
    );
  }
}
