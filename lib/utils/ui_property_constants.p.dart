/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 * LinkedIn: linkedin.com/in/nvbien2000
 */

part of '../unit_tree_flutter.dart';

/// Default values/widgets for [UIProperties]
class UIConst<T extends AbsNodeType> {
  static const title = "";

  static const titleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const emptyWidget = Center(
    child: const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.list_outlined, color: Colors.orange),
        SizedBox(height: 10),
        Text("Empty list"),
      ],
    ),
  );

  static Widget? nullFuncW<T>(TreeType tree) => null;
  static TextStyle? nullFuncT<T>(TreeType tree) => null;
}
