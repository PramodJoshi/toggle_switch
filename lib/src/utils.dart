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
    /// Extra width to prevent overflow and add padding — same slack used for both paths.
    double extraWidth = 0.10 * totalSwitches;

    /// Max screen width
    double screenWidth = MediaQuery.of(context).size.width;

    if (customWidths != null) {
      /// Compute the available space the same way the non-custom path does,
      /// subtracting the same slack so dividers/borders are accounted for.
      final double available = screenWidth / (1 + extraWidth / totalSwitches);
      final double total =
          customWidths.fold<double>(0, (sum, v) => sum + v);

      /// Scale factor is computed once and applied to a single index — O(n) over the build pass.
      final double scale = total > available ? available / total : 1.0;
      return customWidths[index] * scale;
    }

    /// Returns passed minWidth per label if total fits; otherwise scales to fit.
    return (totalSwitches + extraWidth) * minWidth < screenWidth
        ? minWidth
        : screenWidth / (totalSwitches + extraWidth);
  }

  /// Ignores customHeights if toggle switch is horizontal
  static double calculateHeight(
      {required BuildContext context,
      required int index,
      required int totalSwitches,
      List<double>? customHeights,
      required double minHeight}) {
    /// Extra height to prevent overflow and add padding — same slack used for both paths.
    double extraHeight = 0.10 * totalSwitches;

    /// Max screen height
    double screenHeight = MediaQuery.of(context).size.height;

    if (customHeights != null) {
      final double available = screenHeight / (1 + extraHeight / totalSwitches);
      final double total =
          customHeights.fold<double>(0, (sum, v) => sum + v);
      final double scale = total > available ? available / total : 1.0;
      return customHeights[index] * scale;
    }

    return (totalSwitches + extraHeight) * minHeight < screenHeight
        ? minHeight
        : screenHeight / (totalSwitches + extraHeight);
  }
}
