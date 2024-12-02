/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 */

import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';

typedef FGetChildrenFunc<T extends AbsNodeType> = Future<List<TreeType<T>>>
    Function(TreeType<T> parent);
