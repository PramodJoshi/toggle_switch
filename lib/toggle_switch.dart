//Credit : @Eugene (https://stackoverflow.com/questions/56340682/flutter-equvalent-android-toggle-switch)
import 'package:flutter/material.dart';
import 'package:toggle_switch/src/custom_border_paint.dart';
import 'dart:math';

import 'package:toggle_switch/src/row_to_column.dart';
import 'package:toggle_switch/src/utils.dart';

typedef OnToggle = void Function(int? index);
typedef CancelToggle = Future<bool> Function(int? index);

// ignore: must_be_immutable
class ToggleSwitch extends StatefulWidget {
  /// Border color (gradient)
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

  /// List of toggle states [true:enabled; false:disabled]
  final List<bool>? states;

  /// Total number of switches
  final int? totalSwitches;

  /// List of icons
  final List<IconData?>? icons;

  /// List of active background colors (gradient)
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

  /// CancelToggle function
  final CancelToggle? cancelToggle;

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

  /// Set the label to the center
  final bool centerText;

  /// Set multi-line text
  final bool multiLineText;

  /// Set custom widget
  final List<Widget>? customWidgets;

  ToggleSwitch({
    Key? key,
    this.totalSwitches,
    this.labels,
    this.states,
    this.borderColor,
    this.borderWidth,
    this.dividerColor = Colors.white30,
    this.activeBgColor,
    this.activeFgColor,
    this.inactiveBgColor,
    this.inactiveFgColor,
    this.onToggle,
    this.cancelToggle,
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
    this.activeBorders,
    this.centerText = false,
    this.multiLineText = false,
    this.customWidgets,
  }) : super(key: key);

  @override
  _ToggleSwitchState createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch>
    with AutomaticKeepAliveClientMixin<ToggleSwitch> {
  /// Border color
  late List<Color> _borderColor;

  /// Border width
  late double _borderWidth;

  /// Corner radius
  late double _cornerRadius;

  /// Total number of switches
  late int _totalSwitches;

  /// Maintain selection state.
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    /// Searches for largest totalSwitches value
    _totalSwitches = widget.totalSwitches ??
        [
          widget.labels?.length ?? 0,
          widget.icons?.length ?? 0,
          widget.customIcons?.length ?? 0,
          widget.customWidgets?.length ?? 0,
        ].reduce(max);

    /// Assigns transparent border color if it's null/not provided.
    _borderColor = widget.borderColor ?? [Colors.transparent];

    /// Satisfies gradient color requirement
    if (_borderColor.length == 1) {
      _borderColor = List<Color>.filled(2, _borderColor[0]);
    }

    /// Assigns default border width.
    ///
    /// Assigns default border width of 0.0 if border color is null.
    /// Assigns default border width of 3.0 if border width is null but border color is not.
    _borderWidth =
        widget.borderWidth ?? (widget.borderColor == null ? 0.0 : 3.0);

    /// Assigns default corner radius.
    _cornerRadius = widget.cornerRadius - _borderWidth;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    /// Assigns switch states to default true if not provided.
    final List<bool> states =
        widget.states ?? List<bool>.filled(_totalSwitches, true);

    /// Assigns inactive background color to default disabled theme color if it's null/not provided.
    final inactiveBgColor =
        widget.inactiveBgColor ?? Theme.of(context).disabledColor;

    return CustomPaint(
      painter: CustomBorderPaint(
        thickness: _borderWidth,
        radius: Radius.circular(widget.cornerRadius),
        gradient: LinearGradient(
          colors: _borderColor,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(_borderWidth),
        decoration: BoxDecoration(
          color: inactiveBgColor,
          borderRadius: BorderRadius.circular(_cornerRadius),
        ),
        height: !widget.isVertical ? widget.minHeight + _borderWidth : null,
        width: widget.isVertical ? widget.minWidth + _borderWidth : null,
        child: RowToColumn(
          isVertical: widget.isVertical,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(_totalSwitches * 2 - 1, (index) {
            /// Active if index matches current
            final active =
                index ~/ 2 == widget.initialLabelIndex && states[index ~/ 2];

            if (index % 2 == 1) {
              /// Returns divider widget
              return _divider(index: index, active: active);
            } else {
              /// Returns switch item
              return _switchItem(
                index: index,
                active: active,
                states: states,
              );
            }
          }),
        ),
      ),
    );
  }

  /// Returns divider widget
  Container _divider({required int index, required bool active}) {
    final activeDivider = active ||
        (widget.initialLabelIndex != null &&
            index ~/ 2 == widget.initialLabelIndex! - 1);

    return Container(
      width: !widget.isVertical ? 1 : double.infinity,
      height: widget.isVertical ? 1 : double.infinity,
      color: activeDivider ? Colors.transparent : widget.dividerColor,
      margin: widget.isVertical
          ? EdgeInsets.symmetric(
              horizontal: activeDivider ? 0.0 : widget.dividerMargin!)
          : EdgeInsets.symmetric(
              vertical: activeDivider ? 0.0 : widget.dividerMargin!),
    );
  }

  /// Returns switch item
  Widget _switchItem(
      {required int index, required bool active, required List<bool> states}) {
    /// Assigns inactive foreground color to default text theme color if it's null/not provided.
    final inactiveFgColor =
        widget.inactiveFgColor ?? Theme.of(context).textTheme.bodyLarge!.color;

    /// Assigns active foreground color to default accent text theme color if it's null/not provided.
    final activeFgColor = widget.activeFgColor ??
        Theme.of(context).primaryTextTheme.bodyLarge!.color;

    /// Assigns active background color to default primary theme color if it's null/not provided.
    final activeBgColor =
        widget.activeBgColor ?? [Theme.of(context).primaryColor];

    /// Assigns foreground color based on active status.
    ///
    /// Sets active foreground color if current index is active.
    /// Sets inactive foreground color if current index is inactive.
    final fgColor = active ? activeFgColor : inactiveFgColor;

    /// Default background color
    List<Color> bgColor = [Colors.transparent];

    /// Changes background color if current index is active.
    ///
    /// Sets same active background color for all items if active background colors list is empty.
    /// Sets different active background color for current item by matching index if active background colors list is not empty
    if (active) {
      bgColor = widget.activeBgColors == null
          ? activeBgColor
          : (widget.activeBgColors![index ~/ 2] ?? activeBgColor);
    }

    /// Satisfies gradient color requirement
    if (bgColor.length == 1) {
      bgColor = List<Color>.filled(2, bgColor[0]);
    }

    /// Get max possible height
    double height = Utils.calculateHeight(
        context: context,
        index: index ~/ 2,
        totalSwitches: _totalSwitches,
        customHeights: widget.customHeights,
        minHeight: widget.minHeight);

    /// Get max possible width
    double width = Utils.calculateWidth(
        context: context,
        index: index ~/ 2,
        totalSwitches: _totalSwitches,
        customWidths: widget.customWidths,
        minWidth: widget.minWidth);

    /// Assigns active border if available.
    /// If only one active border is passed then we assume that we wanna
    /// apply that active border to all the switches.
    Border? activeBorder;
    if (widget.activeBorders != null) {
      activeBorder = widget.activeBorders!.length == 1
          ? widget.activeBorders![0]
          : (widget.activeBorders!.length > index ~/ 2 &&
                  widget.activeBorders![index ~/ 2] != null
              ? widget.activeBorders![index ~/ 2]!
              : null);
    }

    /// Get icon
    Widget icon = _icon(
        index: index ~/ 2, height: height, width: width, fgColor: fgColor);

    return Flexible(
      child: GestureDetector(
        onTap: () => states[index ~/ 2] ? _handleOnTap(index ~/ 2) : null,
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          constraints: BoxConstraints(
            maxWidth:
                widget.isVertical ? const BoxConstraints().maxWidth : width,
            maxHeight:
                widget.isVertical ? height : const BoxConstraints().maxHeight,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: active ? activeBorder : null,
            borderRadius: widget.radiusStyle
                ? BorderRadius.all(Radius.circular(_cornerRadius))
                : _borderRadius(index: index),
            gradient: LinearGradient(
              colors: bgColor,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          duration: Duration(
              milliseconds: widget.animate ? widget.animationDuration : 0),
          curve: widget.curve,
          child: widget.customWidgets != null
              ? widget.customWidgets![index ~/ 2]
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    icon,
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: (icon is SizedBox) ? 0.0 : 5.0),
                        child: Text(
                          widget.labels?[index ~/ 2] ?? '',
                          textAlign:
                              (widget.centerText) ? TextAlign.center : null,
                          style:
                              _textStyle(index: index ~/ 2, fgColor: fgColor),
                          overflow: (!widget.multiLineText)
                              ? TextOverflow.ellipsis
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  /// Handles selection
  void _handleOnTap(int index) async {
    int? newIndex = index;
    if (widget.doubleTapDisable && widget.initialLabelIndex == index) {
      newIndex = null;
    }

    final cancel = await widget.cancelToggle?.call(newIndex) ?? false;
    if (cancel) {
      return;
    }

    if (widget.changeOnTap) {
      setState(() => widget.initialLabelIndex = newIndex);
    }

    widget.onToggle?.call(newIndex);
  }

  /// Icon widget
  Widget _icon(
      {required int index,
      required double height,
      required double width,
      Color? fgColor}) {
    /// Assigns empty widget if icon is null
    /// Calculates icon's size to prevent overflow
    Widget icon = widget.icons != null && widget.icons![index] != null
        ? Icon(
            widget.icons![index],
            color: fgColor,
            size: widget.isVertical
                ? widget.iconSize > height / 3
                    ? height / 3
                    : widget.iconSize
                : widget.iconSize > width / 3
                    ? width / 3
                    : widget.iconSize,
          )
        : const SizedBox();

    /// Assigns custom icon if available.
    /// Overrides icons passed via icons:
    if (widget.customIcons != null && widget.customIcons![index] != null) {
      icon = widget.customIcons![index]!;
    }

    return icon;
  }

  /// Text style
  TextStyle _textStyle({required int index, Color? fgColor}) {
    /// Assigns custom text styles if available.
    /// Assigns default text style if custom text style is not available.
    /// Overrides fontSize, activeFgColor, inactiveFgColor.
    /// Allow Custom Font Style but still respect activeFgColor and inactiveFgColor
    /// If only one TextStyle is passed then we assume that we wanna
    /// apply that TextStyle to all the switches.

    TextStyle defaultTextStyle = TextStyle(
      color: fgColor,
      fontSize: widget.fontSize,
    );

    TextStyle oneIndexStyle() {
      if (widget.customTextStyles![0]!.color == null) {
        return widget.customTextStyles![0]!.copyWith(
          color: fgColor,
        );
      }
      return widget.customTextStyles![0]!;
    }

    TextStyle multiIndexStyle() {
      if (widget.customTextStyles![index]!.color == null) {
        return widget.customTextStyles![index]!.copyWith(
          color: fgColor,
        );
      }

      return widget.customTextStyles![index]!;
    }

    TextStyle textStyle = defaultTextStyle;
    if (widget.customTextStyles != null) {
      textStyle = widget.customTextStyles!.length == 1
          ? oneIndexStyle()
          : (widget.customTextStyles!.length > index &&
                  widget.customTextStyles![index] != null
              ? multiIndexStyle()
              : defaultTextStyle);
    }

    return textStyle;
  }

  /// Corner radius
  BorderRadius? _borderRadius({required int index}) {
    /// Matches corner radius of active switch to that of border
    BorderRadius? cornerRadius;
    if (index == 0 && !widget.isVertical) {
      /// Checks if text direction is set right-to-left and
      /// assigns corner radius accordingly.
      cornerRadius = widget.textDirectionRTL
          ? BorderRadius.horizontal(
              right: Radius.circular(_cornerRadius),
            )
          : BorderRadius.horizontal(
              left: Radius.circular(_cornerRadius),
            );
    }
    if (index == 0 && widget.isVertical) {
      cornerRadius = BorderRadius.vertical(
        top: Radius.circular(_cornerRadius),
      );
    }
    if (index ~/ 2 == _totalSwitches - 1 && !widget.isVertical) {
      /// Checks if text direction is set right-to-left and
      /// assigns corner radius accordingly.
      cornerRadius = widget.textDirectionRTL
          ? BorderRadius.horizontal(
              left: Radius.circular(_cornerRadius),
            )
          : BorderRadius.horizontal(
              right: Radius.circular(_cornerRadius),
            );
    }
    if (index ~/ 2 == _totalSwitches - 1 && widget.isVertical) {
      cornerRadius = BorderRadius.vertical(
        bottom: Radius.circular(_cornerRadius),
      );
    }

    return cornerRadius;
  }
}
