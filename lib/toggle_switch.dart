//Credit : @Eugene (https://stackoverflow.com/questions/56340682/flutter-equvalent-android-toggle-switch

import 'package:flutter/material.dart';

typedef OnToggle = Future<bool> Function(int index);

class ToggleSwitch extends StatefulWidget {
  final Color activeBgColor;
  final Color activeTextColor;
  final Color inactiveBgColor;
  final Color inactiveTextColor;
  final List<String> labels;
  final double cornerRadius;
  final OnToggle onToggle;
  final int initialLabelIndex;
  final double minWidth;
  final double minHeight;
  final List<IconData> icons;
  final List<Color> activeColors;

  /// [onToggle] is a callback made when the user attempts
  /// to toggle the switch. You can reject the toggle by
  /// returning false, otherwise return true.
  ///
  /// [minHeight] controls the minimum height of the switch. The default
  /// value is 40. Pass [null] to allow the switch to size based on its content.
  ///
  ToggleSwitch({
    Key key,
    @required this.activeBgColor,
    @required this.activeTextColor,
    @required this.inactiveBgColor,
    @required this.inactiveTextColor,
    @required this.labels,
    this.onToggle,
    this.cornerRadius = 8.0,
    this.initialLabelIndex = 0,
    this.minWidth = 72,
    this.minHeight = 40,
    this.icons,
    this.activeColors,
  }) : super(key: key);

  @override
  ToggleSwitchState createState() => ToggleSwitchState();
}

class ToggleSwitchState extends State<ToggleSwitch>
    with AutomaticKeepAliveClientMixin<ToggleSwitch> {
  int current;

  @override
  void initState() {
    current = widget.initialLabelIndex;
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return
        // round the corners of the whole widget
        ClipRRect(
      borderRadius: BorderRadius.circular(widget.cornerRadius),
      child: Container(
        height: widget.minHeight,
        color: widget.inactiveBgColor,
        // the list of options
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(widget.labels.length * 2 - 1, (index) {
            final active = index ~/ 2 == current;
            final textColor =
                active ? widget.activeTextColor : widget.inactiveTextColor;
            var bgColor = Colors.transparent;
            if (active) {
              bgColor = widget.activeColors == null
                  ? widget.activeBgColor
                  : widget.activeColors[index ~/ 2];
            }
            if (index % 2 == 1) {
              final activeDivider = active || index ~/ 2 == current - 1;
              return Container(
                width: 1,
                color: activeDivider ? widget.activeBgColor : Colors.white30,
                margin: EdgeInsets.symmetric(vertical: activeDivider ? 0 : 8),
              );
            } else {
              return GestureDetector(
                onTap: () => _handleOnTap(index ~/ 2),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                  // constraints: BoxConstraints(minWidth: widget.minWidth),
                  alignment: Alignment.center,
                  color: bgColor,
                  child: widget.icons == null
                      ? Text(widget.labels[index ~/ 2],
                          style: TextStyle(color: textColor))
                      : Row(
                          children: <Widget>[
                            Icon(widget.icons[index ~/ 2],
                                color: textColor, size: 17.0),
                            Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(widget.labels[index ~/ 2],
                                    style: TextStyle(color: textColor)))
                          ],
                        ),
                ),
              );
            }
          }),
        ),
      ),
    );
  }

  void _handleOnTap(int index) async {
    setState(() async {
      bool allowToggle = true;
      if (widget.onToggle != null) {
        allowToggle = await widget.onToggle(index);
      }

      if (allowToggle) current = index;
    });
  }

  void setIndex(int index) {
    setState(() => current = index);
  }
}
