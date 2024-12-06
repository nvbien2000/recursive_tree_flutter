import 'dart:ui';

import 'package:example/models/vn_region_node.dart';
import 'package:example/screens/others/dash_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';

class VnExpandedScreen extends StatefulWidget {
  const VnExpandedScreen(this.tree, {super.key});

  final TreeType<VNRegionNode> tree;

  @override
  State<VnExpandedScreen> createState() => _VnExpandedScreenState();
}

class _VnExpandedScreenState extends State<VnExpandedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose an unit"),
      ),
      body: SafeArea(
        child: SExpandedWidget(
          widget.tree,
          properties: UIProperties<VNRegionNode>(
            leadingWidget: (xx) {
              return _buildLeadingWidgetNode(xx);
            },
            nodeTextStyle: (xx) {
              if (xx.isLeaf && xx.data.isChosen == true) {
                return const TextStyle(
                  fontWeight: FontWeight.w800,
                  decoration: TextDecoration.underline,
                );
              }
              if (!xx.isLeaf && xx.data.isChosen == null) {
                return const TextStyle(
                  fontWeight: FontWeight.w600,
                );
              }
              return null;
            },
          ),
        ),
      ),
    );
  }

  //? __________________________________________________________________________

  Widget? _buildLeadingWidgetNode(TreeType<VNRegionNode> tree) {
    if (tree.isRoot) {
      return _buildLeadingRoot(tree);
    } else if (tree.isLeaf) {
      return _buildLeadingLeafWithFavoriteIcon(tree);
    } else {
      return _buildLeadingInnerNode(tree);
    }
  }

  Widget _buildLeadingRoot(TreeType<VNRegionNode> tree) {
    return Row(
      children: [
        const SizedBox(width: 20),
        tree.data.isExpanded
            ? Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AnimatedRotation(
                    turns: tree.data.isExpanded ? 0.25 : 0,
                    duration: const Duration(milliseconds: 300),
                    child:
                        SvgPicture.asset("assets/img/icon_expansion_tile.svg"),
                  ),
                  CustomPaint(
                    painter: BottomDashedLinePainterWhenClicked(),
                    child: const SizedBox(
                      height: 20,
                      width: 0,
                    ),
                  ),
                ],
              )
            : AnimatedRotation(
                turns: tree.data.isExpanded ? 0.25 : 0,
                duration: const Duration(milliseconds: 300),
                child: SvgPicture.asset("assets/img/icon_expansion_tile.svg"),
              ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildLeadingInnerNode(TreeType<VNRegionNode> tree) {
    if (tree.data.isExpanded) {
      return SizedBox(
        width: 40,
        height: 50,
        child: Row(
          children: [
            CustomPaint(
              painter: TopDashedLinePainterWhenClicked(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: 20,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedRotation(
                  turns: tree.data.isExpanded ? 0.25 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: SvgPicture.asset("assets/img/icon_expansion_tile.svg"),
                ),
                CustomPaint(
                  painter: BottomDashedLinePainterWhenClicked(),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                    width: 0,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return SizedBox(
        width: 30,
        height: 50,
        child: Row(
          children: [
            CustomPaint(
              painter: tree.data.toString() ==
                      findRightmostOfABranch(tree).data.toString()
                  ? TopDashedLinePainterWhenClicked()
                  : DashedLinePainter(),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
                height: MediaQuery.of(context).size.height * 0.08,
              ),
            ),
            AnimatedRotation(
              turns: tree.data.isExpanded ? 0.25 : 0,
              duration: const Duration(milliseconds: 300),
              child: SvgPicture.asset("assets/img/icon_expansion_tile.svg"),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildLeadingLeafWithFavoriteIcon(TreeType<VNRegionNode> tree) {
    return Row(
      children: [
        SizedBox(
          height: 70.0,
          width: 35.0,
          child: Row(
            children: [
              CustomPaint(
                painter: tree.data.toString() ==
                        findRightmostOfABranch(tree).data.toString()
                    ? TopDashedLinePainterWhenClicked()
                    : DashedLinePainter(),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.04,
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
              ),
              SvgPicture.asset("assets/img/icon_expansion_tile.svg"),
            ],
          ),
        ),
        const SizedBox(width: 8),
        //? no display favorite icon if current tree is a inner node
        InkWell(
          onTap: () {
            tree.data.isFavorite = !tree.data.isFavorite;
            setState(() {});
          },
          child: SizedBox(
            width: 25,
            height: 25,
            child: tree.data.isFavorite
                ? SvgPicture.asset("assets/img/ic_filled_heart.svg")
                : SvgPicture.asset("assets/img/ic_heart.svg"),
          ),
        ),
      ],
    );
  }
}
