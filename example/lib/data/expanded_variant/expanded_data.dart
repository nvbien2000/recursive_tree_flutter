import 'package:unit_tree_flutter/unit_tree_flutter.dart';

TreeType<EasyNodeType> sampleExpandedData() {
  Map<String, dynamic> data = {
    "data": {
      "id": 0,
      "title": "Root: Level 0",
    },
    "children": [
      {
        "data": {
          "id": 11,
          "title": "(Inner) Ex title: Level 1.1",
        },
        "children": [
          {
            "data": {
              "id": 21,
              "title": "(Inner) Ex title: Level 2.1",
            },
            "children": [
              {
                "data": {
                  "id": 31,
                  "title":
                      "(Leaf) Ex title: Level 3.1\nUse [maxLines] if your title is too long",
                  "isInner": false,
                },
              },
              {
                "data": {
                  "id": 32,
                  "title":
                      "(Leaf) Ex title: Level 3.2\nUse [maxLines] if your title is too long",
                  "isInner": false,
                },
              },
              {
                "data": {
                  "id": 33,
                  "title":
                      "(Leaf) Ex title: Level 3.3\nUse [maxLines] if your title is too long",
                  "isInner": false,
                },
              },
            ],
          },
          {
            "data": {
              "id": 22,
              "title": "(Inner) Ex title: Level 2.2",
            },
            "children": [
              {
                "data": {
                  "id": 34,
                  "title":
                      "(Leaf) Ex title: Level 3.4\nUse [maxLines] if your title is too long",
                  "isInner": false,
                },
              },
            ],
          },
          {
            "data": {
              "id": 23,
              "title": "(Inner) Ex title: Level 2.3",
            },
          },
        ],
      },
      {
        "data": {
          "id": 12,
          "title": "(Inner) Ex title: Level 1.2",
        },
      },
    ],
  };

  var tree = TreeType.fromJson<EasyNodeType>(
    json: data,
    parent: null,
    implFromJson: EasyNodeType.fromJson,
  );

  // it is VERY important to call this function
  updateAllUnavailableNodes(tree);

  return tree;
}
