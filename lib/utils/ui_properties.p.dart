/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 * LinkedIn: linkedin.com/in/nvbien2000
 */

part of '../recursive_tree_flutter.dart';

/// Various ways to customize your UI!
class UIProperties<T extends AbsNodeType> {
  const UIProperties({
    this.stackTitle = UIConst.title,
    this.stackTitleStyle,
    this.stackTitleMaxLines,
    //
    this.nodeTextStyle = UIConst.nullFuncT,
    this.nodeMaxLines,
    //
    this.stackEmptyWidget = UIConst.emptyWidget,
    //
    this.leadingWidget = UIConst.nullFuncW,
    this.trailingWidget = UIConst.nullFuncW,
    //
    this.expandedPhysics = const NeverScrollableScrollPhysics(),
  });

  final String stackTitle;
  final TextStyle? stackTitleStyle;
  final int? stackTitleMaxLines;

  final TextStyle? Function(TreeType<T>) nodeTextStyle;
  final int? nodeMaxLines;

  final Widget stackEmptyWidget;

  final Widget? Function(TreeType<T>) leadingWidget;
  final Widget? Function(TreeType<T>) trailingWidget;

  /// The scroll physics for Expanded variants. Default is
  /// [NeverScrollableScrollPhysics]. This physics is used inside
  /// `ListView.builder` children nodes.
  ///
  /// To see the effect, change it to null or [BouncingScrollPhysics].
  final ScrollPhysics? expandedPhysics;
}
