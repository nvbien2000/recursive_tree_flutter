/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 */

part of '../unit_tree_flutter.dart';

typedef FGetChildrenFunc<T extends AbsNodeType> = Future<List<TreeType<T>>>
    Function(TreeType<T> parent);
