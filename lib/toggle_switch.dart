//Credit : @Eugene (https://stackoverflow.com/questions/56340682/flutter-equvalent-android-toggle-switch)

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef OnToggle = void Function(int index);

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
  final int totalSwitches;

  /// List of icons
  final List<IconData?>? icons;

  /// List of active foreground colors
  final List<List<Color>?>? activeBgColors;

  /// List of custom text styles
  final List<TextStyle?>? customTextStyles;

  /// List of custom icons
  final List<Icon?>? customIcons;

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

  /// Border width
  final double? borderWidth;

  /// OnToggle function
  final OnToggle? onToggle;

  /// Change selection on tap
  final bool changeOnTap;

  /// Set animation
  final bool animate;

  /// Set radius style
  final bool radiusStyle;

  /// Animation curve
  final Curve curve;

  /// Initial label index
  int initialLabelIndex;

  ToggleSwitch({
    Key? key,
    required this.totalSwitches,
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
    this.animate = false,
    this.curve = Curves.easeIn,
    this.radiusStyle = false,
    this.fontSize = 14.0,
    this.iconSize = 17.0,
  }) : super(key: key);

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
    super.build(context);

    /// Assigns active background color to default primary theme color if it's null/not provided.
    activeBgColor = widget.activeBgColor == null
        ? [Theme.of(context).primaryColor]
        : widget.activeBgColor;

    /// Assigns active foreground color to default accent text theme color if it's null/not provided.
    activeFgColor = widget.activeFgColor == null
        ? Theme.of(context).accentTextTheme.bodyText1!.color
        : widget.activeFgColor;

    /// Assigns inactive background color to default disabled theme color if it's null/not provided.
    inactiveBgColor = widget.inactiveBgColor == null
        ? Theme.of(context).disabledColor
        : widget.inactiveBgColor;

    /// Assigns inactive foreground color to default text theme color if it's null/not provided.
    inactiveFgColor = widget.inactiveFgColor == null
        ? Theme.of(context).textTheme.bodyText1!.color
        : widget.inactiveFgColor;

    /// Assigns transparent border color if it's null/not provided.
    borderColor =
        widget.borderColor == null ? [Colors.transparent] : widget.borderColor;

    /// Assigns default border width.
    ///
    /// Assigns default border width of 0.0 if border color is null.
    /// Assigns default border width of 3.0 if border width is null but border color is not.
    borderWidth = widget.borderWidth == null
        ? (widget.borderColor == null ? 0.0 : 3.0)
        : widget.borderWidth;

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
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(widget.cornerRadius),
                  bottomLeft: Radius.circular(widget.cornerRadius),
                  topRight: Radius.circular(widget.cornerRadius),
                  bottomRight: Radius.circular(widget.cornerRadius))),
          height: widget.minHeight + borderWidth!,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(widget.totalSwitches * 2 - 1, (index) {
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
                final activeDivider =
                    active || index ~/ 2 == widget.initialLabelIndex - 1;

                /// Returns item divider
                return Container(
                  width: 1,
                  color:
                      activeDivider ? Colors.transparent : widget.dividerColor,
                  margin: EdgeInsets.symmetric(vertical: activeDivider ? 0 : 8),
                );
              } else {
                /// Matches corner radius of active switch to that of border
                var cornerRadius;
                if (index == 0) {
                  cornerRadius = BorderRadius.only(
                      topLeft: Radius.circular(widget.cornerRadius),
                      bottomLeft: Radius.circular(widget.cornerRadius));
                }
                if (index ~/ 2 == widget.totalSwitches - 1) {
                  cornerRadius = BorderRadius.only(
                      topRight: Radius.circular(widget.cornerRadius),
                      bottomRight: Radius.circular(widget.cornerRadius));
                }

                /// Assigns empty widget if icon is null
                /// Calculates icon's size to prevent overflow
                var icon =
                    widget.icons != null && widget.icons![index ~/ 2] != null
                        ? Icon(
                            widget.icons![index ~/ 2],
                            color: fgColor,
                            size: widget.iconSize >
                                    (_calculateWidth(widget.minWidth) / 3)
                                ? (_calculateWidth(widget.minWidth)) / 3
                                : widget.iconSize,
                          )
                        : Container();

                /// Assigns custom icon if available
                /// Overwrites icons passed via icons:
                if (widget.customIcons != null &&
                    widget.customIcons![index ~/ 2] != null) {
                  icon = widget.customIcons![index ~/ 2]!;
                }

                /// Assigns custom text styles if available.
                /// Assigns default text style if custom text style is not available.
                var textStyle = widget.customTextStyles != null &&
                        widget.customTextStyles![index ~/ 2] != null
                    ? widget.customTextStyles![index ~/ 2]
                    : TextStyle(
                        color: fgColor,
                        fontSize: widget.fontSize,
                      );

                /// Returns switch item
                return GestureDetector(
                  onTap: () => _handleOnTap(index ~/ 2),
                  child: AnimatedContainer(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    constraints: BoxConstraints(
                        maxWidth: _calculateWidth(widget.minWidth)),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
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
                    duration: Duration(milliseconds: widget.animate ? 800 : 0),
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
    setState(() => widget.initialLabelIndex = index);
    if (widget.onToggle != null) {
      widget.onToggle!(index);
    }
  }

  /// Calculates width to prevent overflow by taking screen width into account.
  double _calculateWidth(double minWidth) {
    /// Extra width to prevent overflow and add padding
    double extraWidth = 0.10 * widget.totalSwitches;

    /// Max screen width
    double screenWidth = MediaQuery.of(context).size.width;

    /// Returns width per label
    ///
    /// Returns passed minWidth per label if total requested width plus extra width is less than max screen width.
    /// Returns calculated width to fit within the max screen width if total requested width plus extra width is more than max screen width.
    return (widget.totalSwitches + extraWidth) * widget.minWidth < screenWidth
        ? widget.minWidth
        : screenWidth / (widget.totalSwitches + extraWidth);
  }
}
