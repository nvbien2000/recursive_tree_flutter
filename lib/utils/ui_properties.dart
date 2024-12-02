import 'package:flutter/material.dart';

part 'ui_property_constants.p.dart';

/// UNLIMITED ways to customize your UI!
class UIProperties {
  const UIProperties({
    this.title = UIConst.title,
    this.titleStyle,
    this.nodeTextStyle,
    this.titleMaxLines,
    this.nodeMaxLines,
    //
    this.emptyWidget = UIConst.emptyWidget,
    this.loadingWidget = UIConst.loadingWidget,
    this.errorWidget = UIConst.errorWidget,
    //
    this.leafLeadingWidget,
    this.innerNodeLeadingWidget,
    this.rootLeadingWidget,
    //
    this.leafTrailingWidget,
    this.innerNodeTrailingWidget,
    this.rootTrailingWidget,
  });

  final String title;
  final TextStyle? titleStyle;
  final TextStyle? nodeTextStyle;
  final int? titleMaxLines;
  final int? nodeMaxLines;

  final Widget emptyWidget;
  final Widget loadingWidget;
  final Widget errorWidget;

  final Widget? leafLeadingWidget;
  final Widget? innerNodeLeadingWidget;
  final Widget? rootLeadingWidget;

  final Widget? leafTrailingWidget;
  final Widget? innerNodeTrailingWidget;
  final Widget? rootTrailingWidget;
}
