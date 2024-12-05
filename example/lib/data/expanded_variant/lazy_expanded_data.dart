import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';

TreeType<EasyNodeType> createRoot() {
  Map<String, dynamic> data = {
    "data": {
      "id": 0,
      "title": "Root: Level 0",
    },
  };

  var tree = TreeType.fromJson<EasyNodeType>(
    json: data,
    parent: null,
    implFromJson: EasyNodeType.fromJson,
  );

  return tree;
}

//? ------------------ lv 1

List<TreeType<EasyNodeType>> createChildrenOfRoot(
    TreeType<EasyNodeType> parent) {
  var tree1_1 = TreeType.fromJson<EasyNodeType>(
    json: {
      "data": {
        "id": 11,
        "title": "(Inner) Ex title: Level 1.1",
      },
    },
    parent: parent,
    implFromJson: EasyNodeType.fromJson,
  );

  var tree1_2 = TreeType.fromJson<EasyNodeType>(
    json: {
      "data": {
        "id": 12,
        "title": "(Inner) Ex title: Level 1.2",
      },
    },
    parent: parent,
    implFromJson: EasyNodeType.fromJson,
  );

  return [tree1_1, tree1_2];
}

//? ------------------ lv 2

List<TreeType<EasyNodeType>> createChildrenOfLv1_1(
    TreeType<EasyNodeType> parent) {
  var tree2_1 = TreeType.fromJson<EasyNodeType>(
    json: {
      "data": {
        "id": 21,
        "title": "(Inner) Ex title: Level 2.1",
      },
    },
    parent: parent,
    implFromJson: EasyNodeType.fromJson,
  );

  var tree2_2 = TreeType.fromJson<EasyNodeType>(
    json: {
      "data": {
        "id": 22,
        "title": "(Inner) Ex title: Level 2.2",
      },
    },
    parent: parent,
    implFromJson: EasyNodeType.fromJson,
  );

  var tree2_3 = TreeType.fromJson<EasyNodeType>(
    json: {
      "data": {
        "id": 23,
        "title": "(Inner) Ex title: Level 2.3",
      },
    },
    parent: parent,
    implFromJson: EasyNodeType.fromJson,
  );

  return [tree2_1, tree2_2, tree2_3];
}

//? ------------------ lv 3

List<TreeType<EasyNodeType>> createChildrenOfLv2_1(
    TreeType<EasyNodeType> parent) {
  var tree3_1 = TreeType.fromJson<EasyNodeType>(
    json: {
      "data": {
        "id": 31,
        "title":
            "(Leaf) Ex title: Level 3.1\nUse [maxLines] if your title is too long",
        "isInner": false,
      },
    },
    parent: parent,
    implFromJson: EasyNodeType.fromJson,
  );

  var tree3_2 = TreeType.fromJson<EasyNodeType>(
    json: {
      "data": {
        "id": 32,
        "title":
            "(Leaf) Ex title: Level 3.2\nUse [maxLines] if your title is too long",
        "isInner": false,
      },
    },
    parent: parent,
    implFromJson: EasyNodeType.fromJson,
  );

  var tree3_3 = TreeType.fromJson<EasyNodeType>(
    json: {
      "data": {
        "id": 33,
        "title":
            "(Leaf) Ex title: Level 3.3\nUse [maxLines] if your title is too long",
        "isInner": false,
      },
    },
    parent: parent,
    implFromJson: EasyNodeType.fromJson,
  );

  return [tree3_1, tree3_2, tree3_3];
}

List<TreeType<EasyNodeType>> createChildrenOfLv2_2(
    TreeType<EasyNodeType> parent) {
  var tree3_4 = TreeType.fromJson<EasyNodeType>(
    json: {
      "data": {
        "id": 34,
        "title":
            "(Leaf) Ex title: Level 3.4\nUse [maxLines] if your title is too long",
        "isInner": false,
      },
    },
    parent: parent,
    implFromJson: EasyNodeType.fromJson,
  );

  return [tree3_4];
}
