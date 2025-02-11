import 'package:flutter/material.dart';

/// A widget that displays its children in a row or column based on the value of isVertical (toggle switch type).
class RowToColumn extends StatelessWidget {
  final List<Widget> children;
  final bool isVertical;
  final bool? isColumnToRow;

  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final CrossAxisAlignment? crossAxisAlignment;

  const RowToColumn(
      {Key? key,
      required this.children,
      required this.isVertical,
      this.isColumnToRow,
      this.mainAxisAlignment,
      this.mainAxisSize,
      this.crossAxisAlignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isRow = (isColumnToRow ?? false) ? isVertical : !isVertical;
    final Widget layout = isRow
        ? Row(
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
            mainAxisSize: mainAxisSize ?? MainAxisSize.max,
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
            children: children,
          )
        : Column(
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
            mainAxisSize: mainAxisSize ?? MainAxisSize.max,
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
            children: children,
          );

    return layout;
  }
}
