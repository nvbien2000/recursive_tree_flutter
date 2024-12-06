// ignore_for_file: constant_identifier_names

import 'package:example/data/others/dvhcvn.dart';
import 'package:example/models/vn_region_node.dart';
import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';

Future<TreeType<VNRegionNode>> sampleVNData() async {
  //? Create root --------------------------------------------
  var root = TreeType<VNRegionNode>(
    data: VNRegionNode(
      id: "0",
      title: "Việt Nam",
      level: 0,
    ),
    children: [],
    parent: null,
  );

  //? --------------------------------------------------------

  final rawData = dvhcvn["data"] as List<Map<String, dynamic>>;

  //* Province ---------------------------------------
  rawData.forEach((rawProvince) {
    final p = TreeType<VNRegionNode>(
      data: VNRegionNode(
        id: rawProvince["level1_id"],
        title: rawProvince["name"],
        level: 1,
      ),
      children: [],
      parent: root,
    );

    root.children.add(p);

    //* District ---------------------------------------
    final rawDistricts = rawProvince["level2s"] as List<Map<String, dynamic>>;
    rawDistricts.forEach((rawDistrict) {
      final d = TreeType<VNRegionNode>(
        data: VNRegionNode(
          id: rawDistrict["level2_id"],
          title: rawDistrict["name"],
          level: 2,
        ),
        children: [],
        parent: p,
      );

      p.children.add(d);

      //* Ward ---------------------------------------
      final rawWards = rawDistrict["level3s"] as List;
      rawWards.forEach((rr) {
        var rawWard = rr as Map<String, dynamic>;
        final w = TreeType<VNRegionNode>(
          data: VNRegionNode(
            id: rawWard["level3_id"],
            title: rawWard["name"],
            isInner: false,
            level: 3,
          ),
          children: [],
          parent: d,
        );

        d.children.add(w);
      });
    });
  });

  return root;
}
