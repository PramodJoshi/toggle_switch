//Credit : @Eugene (https://stackoverflow.com/questions/56340682/flutter-equvalent-android-toggle-switch

import 'package:flutter/material.dart';

typedef OnToggle = void Function(int index);

class ToggleSwitch extends StatefulWidget {

  final Color activeBgColor;
  final Color activeTextColor;

  final Color inactiveBgColor;
  final Color inactiveTextColor;

  final Color disabledBgColor;
  final Color disabledTextColor;
  final Color disabledDividerColor;

  final List<String> labels;

  final double cornerRadius;

  final OnToggle onToggle;

  final int initialLabelIndex;

  final double minWidth;

  final List<IconData> icons;
  final List<Color> activeColors;
  final List<int> disabledIndexes;

  bool disabled;

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
    this.icons,
    this.disabled = false,
    this.disabledIndexes,
    this.disabledBgColor      = Colors.white54,
    this.disabledTextColor    = Colors.white70,
    this.disabledDividerColor = Colors.white38,
    this.activeColors
  }) : super(key: key);

  @override
  _ToggleSwitchState createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch>
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
  Widget build( BuildContext context ) {

    super.build( context );

    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.cornerRadius),
      child: Container(
        height: 40,
        color: widget.inactiveBgColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate( widget.labels.length * 2 - 1, ( index ) {

            final active = index ~/ 2 == current;

            var bgColor   = Colors.transparent;
            var textColor = widget.inactiveTextColor;
            var disabled  = widget.disabled || ( widget.disabledIndexes != null && widget.disabledIndexes.contains( index ~/ 2 ) );

            if ( disabled ) {

              bgColor   = widget.disabledBgColor;
              textColor = widget.disabledTextColor;
            }
            else if ( active ) {

              bgColor = widget.activeColors == null
                  ? widget.activeBgColor
                  : widget.activeColors[index ~/ 2];
            }

            if ( index % 2 == 1 ) {

              final activeDivider = active || index ~/ 2 == current - 1;

              return Container(
                width: 1,
                color: ( widget.disabled ? widget.disabledDividerColor : ( activeDivider ? widget.activeBgColor : Colors.white30 ) ),
                margin: EdgeInsets.symmetric( vertical: activeDivider ? 0 : 8 ),
              );
            }
            else {

              return GestureDetector(
                onTap: () => ( disabled ? null : _handleOnTap( index ~/ 2 ) ),
                child: Container(
                  constraints: BoxConstraints( minWidth: widget.minWidth ),
                  alignment: Alignment.center,
                  color: bgColor,
                  child: widget.icons == null
                      ? Text(
                          widget.labels[ index ~/ 2 ],
                          style: TextStyle( color: textColor )
                        )
                      : Row(
                          children: <Widget>[
                            Icon(
                              widget.icons[index ~/ 2 ],
                              color: textColor,
                              size: 17.0
                            ),
                            Padding(
                              padding: const EdgeInsets.only( left: 5.0 ),
                              child: Text(
                                widget.labels[ index ~/ 2 ],
                                style: TextStyle(
                                  color: textColor
                                )
                              )
                            )
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

  void _handleOnTap( int index ) async {

    setState( () => current = index );

    if ( widget.onToggle != null ) {
      widget.onToggle( index );
    }
  }
}
