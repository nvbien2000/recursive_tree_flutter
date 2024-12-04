import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';

import '../../models/ex.dart';

TreeType<EasyNodeType> createRoot() => TreeType<EasyNodeType>(
      data: Ex.sampleInner("0"),
      children: [],
      parent: null,
    );

//? ------------------ lv 1

List<TreeType<EasyNodeType>> createChildrenOfRoot() => [
      TreeType<EasyNodeType>(
        data: Ex.sampleInner("1.1"),
        children: [],
        parent: null,
      ),
      TreeType<EasyNodeType>(
        data: Ex.sampleInner("1.2"),
        children: [],
        parent: null,
      ),
    ];

//? ------------------ lv 2

List<TreeType<EasyNodeType>> createChildrenOfLv1_1() => [
      TreeType<EasyNodeType>(
        data: Ex.sampleInner("2.1"),
        children: [],
        parent: null,
      ),
      TreeType<EasyNodeType>(
        data: Ex.sampleInner("2.2"),
        children: [],
        parent: null,
      ),
      TreeType<EasyNodeType>(
        data: Ex.sampleInner("2.3"),
        children: [],
        parent: null,
      ),
    ];

//? ------------------ lv 3

List<TreeType<EasyNodeType>> createChildrenOfLv2_1() => [
      TreeType<EasyNodeType>(
        data: Ex.sampleLeaf("3.1"),
        children: [],
        parent: null,
      ),
      TreeType<EasyNodeType>(
        data: Ex.sampleLeaf("3.2"),
        children: [],
        parent: null,
      ),
      TreeType<EasyNodeType>(
        data: Ex.sampleLeaf("3.3"),
        children: [],
        parent: null,
      ),
    ];

List<TreeType<EasyNodeType>> createChildrenOfLv2_2() => [
      TreeType<EasyNodeType>(
        data: Ex.sampleLeaf("3.4"),
        children: [],
        parent: null,
      ),
    ];
