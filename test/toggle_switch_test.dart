import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:toggle_switch/toggle_switch.dart';

void main() {
  testWidgets('Can set active background color', (WidgetTester tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: new MediaQueryData(),
        child: MaterialApp(
          home: ToggleSwitch(
            totalSwitches: 2,
            activeBgColor: [Colors.blue],
          ),
        ),
      ),
    );
    final widget = tester.widget<ToggleSwitch>(find.byType(ToggleSwitch));
    expect(widget.activeBgColor, equals([Colors.blue]));
  });

  testWidgets('Can set inactive background color', (WidgetTester tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: new MediaQueryData(),
        child: MaterialApp(
          home: ToggleSwitch(
            totalSwitches: 2,
            inactiveBgColor: Colors.grey,
          ),
        ),
      ),
    );
    final widget = tester.widget<ToggleSwitch>(find.byType(ToggleSwitch));
    expect(widget.inactiveBgColor, equals(Colors.grey));
  });

  testWidgets('Can set active foreground color', (WidgetTester tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: new MediaQueryData(),
        child: MaterialApp(
          home: ToggleSwitch(
            activeFgColor: Colors.white70,
            totalSwitches: 3,
          ),
        ),
      ),
    );
    final widget = tester.widget<ToggleSwitch>(find.byType(ToggleSwitch));
    expect(widget.activeFgColor, equals(Colors.white70));
  });

  testWidgets('Can set inactive foreground color', (WidgetTester tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: new MediaQueryData(),
        child: MaterialApp(
          home: ToggleSwitch(
            inactiveFgColor: Colors.black,
            totalSwitches: 3,
          ),
        ),
      ),
    );
    final widget = tester.widget<ToggleSwitch>(find.byType(ToggleSwitch));
    expect(widget.inactiveFgColor, equals(Colors.black));
  });

  testWidgets('Can set number of total switches', (WidgetTester tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: new MediaQueryData(),
        child: MaterialApp(
          home: ToggleSwitch(
            totalSwitches: 5,
          ),
        ),
      ),
    );
    final widget = tester.widget<ToggleSwitch>(find.byType(ToggleSwitch));
    expect(widget.totalSwitches, equals(5));
  });

  testWidgets('Can set icons', (WidgetTester tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: new MediaQueryData(),
        child: MaterialApp(
          home: ToggleSwitch(totalSwitches: 2, icons: [Icons.add, Icons.clear]),
        ),
      ),
    );
    final widget = tester.widget<ToggleSwitch>(find.byType(ToggleSwitch));
    expect(widget.icons, equals([Icons.add, Icons.clear]));
  });

  testWidgets('Can set default active switch', (WidgetTester tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: new MediaQueryData(),
        child: MaterialApp(
          home: ToggleSwitch(
            totalSwitches: 2,
            initialLabelIndex: 1,
          ),
        ),
      ),
    );
    final widget = tester.widget<ToggleSwitch>(find.byType(ToggleSwitch));
    expect(widget.initialLabelIndex, equals(1));
  });

  testWidgets('Can set minimum height', (WidgetTester tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: new MediaQueryData(),
        child: MaterialApp(
          home: ToggleSwitch(
            totalSwitches: 2,
            minHeight: 50.0,
          ),
        ),
      ),
    );
    final widget = tester.widget<ToggleSwitch>(find.byType(ToggleSwitch));
    expect(widget.minHeight, equals(50.0));
  });

  testWidgets('Can set minimum width', (WidgetTester tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: new MediaQueryData(),
        child: MaterialApp(
          home: ToggleSwitch(
            totalSwitches: 2,
            minWidth: 40.0,
          ),
        ),
      ),
    );
    final widget = tester.widget<ToggleSwitch>(find.byType(ToggleSwitch));
    expect(widget.minWidth, equals(40.0));
  });

  testWidgets('Can set custom widths', (WidgetTester tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: new MediaQueryData(),
        child: MaterialApp(
          home: ToggleSwitch(
            totalSwitches: 2,
            customWidths: [40.0, 50.0],
          ),
        ),
      ),
    );
    final widget = tester.widget<ToggleSwitch>(find.byType(ToggleSwitch));
    expect(widget.customWidths![1], equals(50.0));
  });

  testWidgets('Can set default active switch to null',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: new MediaQueryData(),
        child: MaterialApp(
          home: ToggleSwitch(
            totalSwitches: 2,
            initialLabelIndex: null,
          ),
        ),
      ),
    );
    final widget = tester.widget<ToggleSwitch>(find.byType(ToggleSwitch));
    expect(widget.initialLabelIndex, equals(null));
  });
}
