import 'dart:math';

import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';

class Ex {
  static EasyNodeType sampleRandomInner() {
    final createdAt =
        '${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}';

    return EasyNodeType(
      id: Random().nextInt(100000),
      title: "[Inner] Random inner node created at: $createdAt",
      subtitle: "Random inner node subtitle $createdAt",
      isUnavailable: true,
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
