import 'package:flutter/material.dart';

class Utils {
  /// Calculates width to prevent overflow by taking screen width into account.
  /// Ignores customWidths if toggle switch is vertical
  static double calculateWidth(
      {required BuildContext context,
      required int index,
      required int totalSwitches,
      List<double>? customWidths,
      required double minWidth}) {
    /// Extra width to prevent overflow and add padding
    double extraWidth = 0.10 * totalSwitches;

    /// Max screen width
    double screenWidth = MediaQuery.of(context).size.width;

    /// Returns width per label
    ///
    /// Returns passed minWidth per label if total requested width plus extra width is less than max screen width.
    /// Returns calculated width to fit within the max screen width if total requested width plus extra width is more than max screen width.
    return customWidths != null
        ? customWidths[index]
        : ((totalSwitches + extraWidth) * minWidth < screenWidth
            ? minWidth
            : screenWidth / (totalSwitches + extraWidth));
  }

  /// Ignores customHeights if toggle switch is horizontal
  static double calculateHeight(
      {required BuildContext context,
      required int index,
      required int totalSwitches,
      List<double>? customHeights,
      required double minHeight}) {
    /// Extra height to prevent overflow and add padding
    double extraHeight = 0.10 * totalSwitches;

    /// Max screen height
    double screenHeight = MediaQuery.of(context).size.height;

    /// Returns width per label
    ///
    /// Returns passed minHeight per label if total requested width plus extra height is less than max screen height.
    /// Returns calculated width to fit within the max screen width if total requested width plus extra height is more than max screen height.
    return customHeights != null
        ? customHeights[index]
        : ((totalSwitches + extraHeight) * minHeight < screenHeight
            ? minHeight
            : screenHeight / (totalSwitches + extraHeight));
  }
}
