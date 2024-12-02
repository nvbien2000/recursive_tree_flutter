import 'dart:math';

import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';

class Ex {
  static EasyNodeType sampleInner(String level) {
    return EasyNodeType(
      id: Random().nextInt(100000),
      title: level == "0"
          ? "Root: Level $level"
          : "(Inner) Ex title: Level $level",
      subtitle: "Subtitle of level = $level",
    );
  }

  static EasyNodeType sampleLeaf(String level) {
    return EasyNodeType(
      id: Random().nextInt(100000),
      title:
          "(Leaf) Ex title: Level $level\nUse [maxLines] if your title is too long",
      subtitle: "Subtitle of leaf, level = $level",
      isInner: false,
    );
  }

  /// isExpanded = true
  static EasyNodeType sampleInnerExpanded(String level) {
    return EasyNodeType(
      id: Random().nextInt(100000),
      title: "(Inner) Ex title: Level $level",
      subtitle: "Subtitle of level = $level",
      isExpanded: true,
    );
  }

  /// isExpanded = true
  static EasyNodeType sampleLeafExpanded(String level) {
    return EasyNodeType(
      id: Random().nextInt(100000),
      title: "(Leaf) Ex title: Level $level",
      subtitle: "Subtitle of leaf, level = $level",
      isInner: false,
      isExpanded: true,
    );
  }

  static EasyNodeType sampleRandomInner() {
    final createdAt =
        '${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}';
    return EasyNodeType(
      id: Random().nextInt(100000),
      title: "[Inner] Random inner node created at: $createdAt",
      subtitle: "Random inner node subtitle $createdAt",
      isUnavailable: true,
      isChosen: null,
    );
  }

  static EasyNodeType sampleRandomLeaf() {
    final createdAt =
        '${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}';
    return EasyNodeType(
      id: Random().nextInt(100000),
      title: "[Leaf] Random leaf created at: $createdAt",
      subtitle: "Random leaf subtitle $createdAt",
      isInner: false,
    );
  }
}
