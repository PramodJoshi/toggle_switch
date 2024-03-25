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
    return ((isColumnToRow ?? false) ? isVertical : !isVertical)
        ? Row(
            mainAxisAlignment:
                mainAxisAlignment ?? const Row().mainAxisAlignment,
            mainAxisSize: mainAxisSize ?? const Row().mainAxisSize,
            crossAxisAlignment:
                crossAxisAlignment ?? const Row().crossAxisAlignment,
            children: children,
          )
        : Column(
            mainAxisAlignment:
                mainAxisAlignment ?? const Column().mainAxisAlignment,
            mainAxisSize: mainAxisSize ?? const Column().mainAxisSize,
            crossAxisAlignment:
                crossAxisAlignment ?? const Column().crossAxisAlignment,
            children: children,
          );
  }
}
