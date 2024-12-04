/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 * LinkedIn: linkedin.com/in/nvbien2000
 */

part of '../recursive_tree_flutter.dart';

/// Various ways to customize your UI!
class UIProperties {
  const UIProperties({
    this.title = UIConst.title,
    this.titleStyle,
    this.nodeTextStyle,
    this.stackTitleMaxLines,
    this.maxLines,
    //
    this.emptyWidget = UIConst.emptyWidget,
    this.loadingWidget = UIConst.loadingWidget,
    this.errorWidget = UIConst.errorWidget,
    //
    this.leafLeadingWidget,

    //
    this.ePhysics = const NeverScrollableScrollPhysics(),
  });

  final String title;
  final TextStyle? titleStyle;
  final TextStyle? nodeTextStyle;
  final int? stackTitleMaxLines;
  final int? maxLines;

  final Widget emptyWidget;
  final Widget loadingWidget;
  final Widget errorWidget;

  final Widget? leafLeadingWidget;

  /// The scroll physics for Expanded variants. Default is
  /// [NeverScrollableScrollPhysics]. This physics is used inside
  /// `ListView.builder` children nodes.
  ///
  /// To see the effect, change it to null or [BouncingScrollPhysics].
  final ScrollPhysics? ePhysics;
}
