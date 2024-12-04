/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 * LinkedIn: linkedin.com/in/nvbien2000
 */

part of '../recursive_tree_flutter.dart';

/// Default values/widgets for [UIProperties]
class UIConst {
  static const title = "";

  static const titleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const emptyWidget = const Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.list_outlined, color: Colors.orange),
      SizedBox(height: 10),
      Text("Empty list"),
    ],
  );

  static const loadingWidget = const CircularProgressIndicator();

  static const errorWidget = const Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Icon(Icons.warning, color: Colors.red),
      const SizedBox(height: 10),
      Text("Error"),
    ],
  );
}
