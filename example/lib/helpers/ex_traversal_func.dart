import 'package:flutter/material.dart';
import 'package:unit_tree_flutter/unit_tree_flutter.dart';

void chosenLeaves(BuildContext context, TreeType tree) {
  List<TreeType<EasyNodeType>> result = [];
  var root = findRoot(tree);
  returnChosenLeaves(root, result);
  String resultTxt = "";
  for (var e in result) {
    resultTxt += "${e.data.title}\n\n";
  }
  if (resultTxt.isEmpty) resultTxt = "none";

  var snackBar = SnackBar(content: Text(resultTxt));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void chosenNodes(BuildContext context, TreeType tree) {
  List<TreeType<EasyNodeType>> result = [];
  var root = findRoot(tree);
  returnChosenNodes(root, result);
  String resultTxt = "";
  for (var e in result) {
    resultTxt += "${e.data.title}\n\n";
  }
  if (resultTxt.isEmpty) resultTxt = "none";

  var snackBar = SnackBar(content: Text(resultTxt));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void searchLeaves(BuildContext context, String txt, TreeType tree) {
  List<TreeType<EasyNodeType>> result = [];
  var root = findRoot(tree);
  searchLeavesWithTitleDFS(root, txt, result);
  String resultTxt = "";
  for (var e in result) {
    resultTxt += "${e.data.title}\n\n";
  }
  if (resultTxt.isEmpty) resultTxt = "none";

  var snackBar = SnackBar(content: Text(resultTxt));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void searchNodes(BuildContext context, String txt, TreeType tree) {
  List<TreeType<EasyNodeType>> result = [];
  var root = findRoot(tree);
  searchAllTreesWithTitleDFS(root, txt, result);
  String resultTxt = "";
  for (var e in result) {
    resultTxt += "${e.data.title}\n\n";
  }
  if (resultTxt.isEmpty) resultTxt = "none";

  var snackBar = SnackBar(content: Text(resultTxt));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
