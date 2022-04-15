//Credit : @Eugene (https://stackoverflow.com/questions/56340682/flutter-equvalent-android-toggle-switch)

import 'package:flutter/material.dart';
import 'dart:math';

typedef OnToggle = void Function(int? index);

// ignore: must_be_immutable
class ToggleSwitch extends StatefulWidget {
  /// Border color
  final List<Color>? borderColor;

  /// Divider color
  final Color dividerColor;

  /// Active background color
  final List<Color>? activeBgColor;

  /// Active foreground color
  final Color? activeFgColor;

  /// Inactive background color
  final Color? inactiveBgColor;

  /// Inactive foreground color
  final Color? inactiveFgColor;

  /// List of labels
  final List<String>? labels;

  /// Total number of switches
  final int? totalSwitches;

  /// List of icons
  final List<IconData?>? icons;

  /// List of active foreground colors
  final List<List<Color>?>? activeBgColors;

  /// List of custom text styles
  final List<TextStyle?>? customTextStyles;

  /// List of custom icons
  final List<Icon?>? customIcons;

  /// List of custom widths
  final List<double>? customWidths;

  /// List of custom heights
  final List<double>? customHeights;

  /// Minimum switch width
  final double minWidth;

  /// Minimum switch height
  final double minHeight;

  /// Widget's corner radius
  final double cornerRadius;

  /// Font size
  final double fontSize;

  /// Icon size
  final double iconSize;

  /// Divider margin
  final double? dividerMargin;

  /// Border width
  final double? borderWidth;

  /// OnToggle function
  final OnToggle? onToggle;

  /// Change selection on tap
  final bool changeOnTap;

  /// Set animation
  final bool animate;

  /// Set animation duration
  final int animationDuration;

  /// Set radius style
  final bool radiusStyle;

  /// Confirm if text direction is set right-to-left
  final bool textDirectionRTL;

  /// Animation curve
  final Curve curve;

  /// Initial label index, set to null for no chosen initial value (all options inactive)
  int? initialLabelIndex;

  /// Tap active switch to de-activate/de-select
  final bool doubleTapDisable;

  /// Use toggle switch vertically
  final bool isVertical;

  /// Set a border only to the active toggle component
  List<Border?>? activeBorders;

  ToggleSwitch(
      {Key? key,
      this.totalSwitches,
      this.labels,
      this.borderColor,
      this.borderWidth,
      this.dividerColor = Colors.white30,
      this.activeBgColor,
      this.activeFgColor,
      this.inactiveBgColor,
      this.inactiveFgColor,
      this.onToggle,
      this.cornerRadius = 8.0,
      this.initialLabelIndex = 0,
      this.minWidth = 72.0,
      this.minHeight = 40.0,
      this.changeOnTap = true,
      this.icons,
      this.activeBgColors,
      this.customTextStyles,
      this.customIcons,
      this.customWidths,
      this.customHeights,
      this.animate = false,
      this.animationDuration = 800,
      this.curve = Curves.easeIn,
      this.radiusStyle = false,
      this.textDirectionRTL = false,
      this.fontSize = 14.0,
      this.iconSize = 17.0,
      this.dividerMargin = 8.0,
      this.doubleTapDisable = false,
      this.isVertical = false,
      this.activeBorders})
      : super(key: key);

  @override
  _ToggleSwitchState createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch>
    with AutomaticKeepAliveClientMixin<ToggleSwitch> {
  /// Active background color
  List<Color>? activeBgColor;

  /// Active foreground color
  Color? activeFgColor;

  /// Inactive background color
  Color? inactiveBgColor;

  /// Inctive foreground color
  Color? inactiveFgColor;

  /// Border color
  List<Color>? borderColor;

  /// Border widtth
  double? borderWidth;

  /// Maintain selection state.
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    /// Searches for largest totalSwitches value
    final int totalSwitches = widget.totalSwitches ??
        [
          widget.labels?.length ?? 0,
          widget.icons?.length ?? 0,
          widget.customIcons?.length ?? 0
        ].reduce(max);
    super.build(context);

    /// Assigns active background color to default primary theme color if it's null/not provided.
    activeBgColor = widget.activeBgColor ?? [Theme.of(context).primaryColor];

    /// Assigns active foreground color to default accent text theme color if it's null/not provided.
    activeFgColor = widget.activeFgColor ??
        Theme.of(context).primaryTextTheme.bodyText1!.color;

    /// Assigns inactive background color to default disabled theme color if it's null/not provided.
    inactiveBgColor = widget.inactiveBgColor ?? Theme.of(context).disabledColor;

    /// Assigns inactive foreground color to default text theme color if it's null/not provided.
    inactiveFgColor =
        widget.inactiveFgColor ?? Theme.of(context).textTheme.bodyText1!.color;

    /// Assigns transparent border color if it's null/not provided.
    borderColor = widget.borderColor ?? [Colors.transparent];

    /// Assigns default border width.
    ///
    /// Assigns default border width of 0.0 if border color is null.
    /// Assigns default border width of 3.0 if border width is null but border color is not.
    borderWidth =
        widget.borderWidth ?? (widget.borderColor == null ? 0.0 : 3.0);

    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.cornerRadius),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: borderColor!.length == 1
                ? [borderColor![0], borderColor![0]]
                : borderColor!,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Container(
          margin: EdgeInsets.all(borderWidth!),
          decoration: BoxDecoration(
              color: inactiveBgColor,
              borderRadius: BorderRadius.circular(widget.cornerRadius)),
          height: !widget.isVertical ? widget.minHeight + borderWidth! : null,
          width: widget.isVertical ? widget.minWidth + borderWidth! : null,
          child: RowToColumn(
            isVertical: widget.isVertical,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(totalSwitches * 2 - 1, (index) {
              /// Active if index matches current
              final active = index ~/ 2 == widget.initialLabelIndex;

              /// Assigns foreground color based on active status.
              ///
              /// Sets active foreground color if current index is active.
              /// Sets inactive foreground color if current index is inactive.
              final fgColor = active ? activeFgColor : inactiveFgColor;

              /// Default background color
              List<Color>? bgColor = [Colors.transparent];

              /// Changes background color if current index is active.
              ///
              /// Sets same active background color for all items if active background colors list is empty.
              /// Sets different active background color for current item by matching index if active background colors list is not empty
              if (active) {
                bgColor = widget.activeBgColors == null
                    ? activeBgColor
                    : (widget.activeBgColors![index ~/ 2] ?? activeBgColor);
              }

              if (index % 2 == 1) {
                final activeDivider = active ||
                    (widget.initialLabelIndex != null &&
                        index ~/ 2 == widget.initialLabelIndex! - 1);

                /// Returns item divider
                return Container(
                  width: !widget.isVertical ? 1 : double.infinity,
                  height: widget.isVertical ? 1 : double.infinity,
                  color:
                      activeDivider ? Colors.transparent : widget.dividerColor,
                  margin: widget.isVertical
                      ? EdgeInsets.symmetric(
                          horizontal:
                              activeDivider ? 0.0 : widget.dividerMargin!)
                      : EdgeInsets.symmetric(
                          vertical:
                              activeDivider ? 0.0 : widget.dividerMargin!),
                );
              } else {
                /// Matches corner radius of active switch to that of border
                var cornerRadius;
                if (index == 0 && !widget.isVertical) {
                  /// Checks if text direction is set right-to-left and
                  /// assigns corner radius accordingly.
                  cornerRadius = widget.textDirectionRTL
                      ? BorderRadius.horizontal(
                          right: Radius.circular(widget.cornerRadius),
                        )
                      : BorderRadius.horizontal(
                          left: Radius.circular(widget.cornerRadius),
                        );
                }
                if (index == 0 && widget.isVertical) {
                  cornerRadius = BorderRadius.vertical(
                    top: Radius.circular(widget.cornerRadius),
                  );
                }
                if (index ~/ 2 == totalSwitches - 1 && !widget.isVertical) {
                  /// Checks if text direction is set right-to-left and
                  /// assigns corner radius accordingly.
                  cornerRadius = widget.textDirectionRTL
                      ? BorderRadius.horizontal(
                          left: Radius.circular(widget.cornerRadius),
                        )
                      : BorderRadius.horizontal(
                          right: Radius.circular(widget.cornerRadius),
                        );
                }
                if (index ~/ 2 == totalSwitches - 1 && widget.isVertical) {
                  cornerRadius = BorderRadius.vertical(
                    bottom: Radius.circular(widget.cornerRadius),
                  );
                }

                /// Assigns empty widget if icon is null
                /// Calculates icon's size to prevent overflow
                var icon = widget.icons != null &&
                        widget.icons![index ~/ 2] != null
                    ? Icon(
                        widget.icons![index ~/ 2],
                        color: fgColor,
                        size: widget.isVertical
                            ? widget.iconSize >
                                    (_calculateHeight(
                                            index ~/ 2, totalSwitches) /
                                        3)
                                ? (_calculateHeight(
                                        index ~/ 2, totalSwitches)) /
                                    3
                                : widget.iconSize
                            : widget.iconSize >
                                    (_calculateWidth(
                                            index ~/ 2, totalSwitches) /
                                        3)
                                ? (_calculateWidth(index ~/ 2, totalSwitches)) /
                                    3
                                : widget.iconSize,
                      )
                    : Container();

                /// Assigns custom icon if available.
                /// Overrides icons passed via icons:
                if (widget.customIcons != null &&
                    widget.customIcons![index ~/ 2] != null) {
                  icon = widget.customIcons![index ~/ 2]!;
                }

                /// Assigns custom text styles if available.
                /// Assigns default text style if custom text style is not available.
                /// Overrides fontSize, activeFgColor, inactiveFgColor.
                /// If only one TextStyle is passed then we assume that we wanna
                /// apply that TextStyle to all the switches.
                TextStyle defaultTextStyle = TextStyle(
                  color: fgColor,
                  fontSize: widget.fontSize,
                );
                var textStyle = defaultTextStyle;
                if (widget.customTextStyles != null) {
                  textStyle = widget.customTextStyles!.length == 1
                      ? widget.customTextStyles![0]!
                      : (widget.customTextStyles!.length > index ~/ 2 &&
                              widget.customTextStyles![index ~/ 2] != null
                          ? widget.customTextStyles![index ~/ 2]!
                          : defaultTextStyle);
                }

                /// Assigns active border if available.
                /// If only one active border is passed then we assume that we wanna
                /// apply that active border to all the switches.
                var activeBorder;
                if (widget.activeBorders != null) {
                  activeBorder = widget.activeBorders!.length == 1
                      ? widget.activeBorders![0]
                      : (widget.activeBorders!.length > index ~/ 2 &&
                              widget.activeBorders![index ~/ 2] != null
                          ? widget.activeBorders![index ~/ 2]!
                          : null);
                }

                /// Returns switch item
                return GestureDetector(
                  onTap: () => _handleOnTap(index ~/ 2),
                  child: AnimatedContainer(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    constraints: BoxConstraints(
                      maxWidth: widget.isVertical
                          ? BoxConstraints().maxWidth
                          : _calculateWidth(index ~/ 2, totalSwitches),
                      maxHeight: widget.isVertical
                          ? _calculateHeight(index ~/ 2, totalSwitches)
                          : BoxConstraints().maxHeight,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: active ? activeBorder : null,
                      borderRadius: widget.radiusStyle
                          ? BorderRadius.all(
                              Radius.circular(widget.cornerRadius))
                          : cornerRadius,
                      gradient: LinearGradient(
                        colors: bgColor!.length == 1
                            ? [bgColor[0], bgColor[0]]
                            : bgColor,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    duration: Duration(
                        milliseconds:
                            widget.animate ? widget.animationDuration : 0),
                    curve: widget.curve,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        icon,
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.only(
                                left: (icon is Container) ? 0.0 : 5.0),
                            child: Text(
                              widget.labels?[index ~/ 2] ?? '',
                              style: textStyle,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }),
          ),
        ),
      ),
    );
  }

  /// Handles selection
  void _handleOnTap(int index) async {
    bool notifyNull = false;
    if (widget.changeOnTap) {
      if (widget.doubleTapDisable && widget.initialLabelIndex == index) {
        setState(() => widget.initialLabelIndex = null);
        notifyNull = true;
      } else {
        setState(() => widget.initialLabelIndex = index);
      }
    }
    if (widget.onToggle != null) {
      if (notifyNull) {
        widget.onToggle!(null);
      } else {
        widget.onToggle!(index);
      }
    }
  }

  /// Calculates width to prevent overflow by taking screen width into account.
  /// Ignores customWidths if toggle switch is vertical
  double _calculateWidth(int index, int totalSwitches) {
    /// Extra width to prevent overflow and add padding
    double extraWidth = 0.10 * totalSwitches;

    /// Max screen width
    double screenWidth = MediaQuery.of(context).size.width;

    /// Returns width per label
    ///
    /// Returns passed minWidth per label if total requested width plus extra width is less than max screen width.
    /// Returns calculated width to fit within the max screen width if total requested width plus extra width is more than max screen width.
    return widget.customWidths != null
        ? widget.customWidths![index]
        : ((totalSwitches + extraWidth) * widget.minWidth < screenWidth
            ? widget.minWidth
            : screenWidth / (totalSwitches + extraWidth));
  }

  /// Ignores customHeights if toggle switch is horizontal
  double _calculateHeight(int index, int totalSwitches) {
    /// Extra height to prevent overflow and add padding
    double extraHeight = 0.10 * totalSwitches;

    /// Max screen height
    double screenHeight = MediaQuery.of(context).size.width;

    /// Returns width per label
    ///
    /// Returns passed minHeight per label if total requested width plus extra height is less than max screen height.
    /// Returns calculated width to fit within the max screen width if total requested width plus extra height is more than max screen height.
    return widget.customHeights != null
        ? widget.customHeights![index]
        : ((totalSwitches + extraHeight) * widget.minHeight < screenHeight
            ? widget.minHeight
            : screenHeight / (totalSwitches + extraHeight));
  }
}

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
            children: children,
            mainAxisAlignment: mainAxisAlignment ?? Row().mainAxisAlignment,
            mainAxisSize: mainAxisSize ?? Row().mainAxisSize,
            crossAxisAlignment: crossAxisAlignment ?? Row().crossAxisAlignment,
          )
        : Column(
            children: children,
            mainAxisAlignment: mainAxisAlignment ?? Column().mainAxisAlignment,
            mainAxisSize: mainAxisSize ?? Column().mainAxisSize,
            crossAxisAlignment:
                crossAxisAlignment ?? Column().crossAxisAlignment,
          );
  }
}
