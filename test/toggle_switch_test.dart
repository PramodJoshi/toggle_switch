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

  testWidgets('Can set vertical toggle switch', (WidgetTester tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: new MediaQueryData(),
        child: MaterialApp(
          home: ToggleSwitch(
            totalSwitches: 3,
            isVertical: true,
            initialLabelIndex: 2,
          ),
        ),
      ),
    );
    final widget = tester.widget<ToggleSwitch>(find.byType(ToggleSwitch));
    expect(widget.isVertical, equals(true));
  });

  testWidgets('Can set active borders', (WidgetTester tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: new MediaQueryData(),
        child: MaterialApp(
          home: ToggleSwitch(
            totalSwitches: 3,
            activeBorders: [Border.all(color: Colors.blue, width: 2.0)],
            initialLabelIndex: 2,
          ),
        ),
      ),
    );
    final widget = tester.widget<ToggleSwitch>(find.byType(ToggleSwitch));
    expect(widget.activeBorders![0],
        equals(Border.all(color: Colors.blue, width: 2.0)));
  });

  testWidgets('Can center text', (WidgetTester tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: new MediaQueryData(),
        child: MaterialApp(
          home: ToggleSwitch(
            totalSwitches: 3,
            initialLabelIndex: 2,
            centerText: true,
          ),
        ),
      ),
    );
    final widget = tester.widget<ToggleSwitch>(find.byType(ToggleSwitch));
    expect(widget.centerText, equals(true));
  });

  testWidgets('Can set multi-line text', (WidgetTester tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: new MediaQueryData(),
        child: MaterialApp(
          home: ToggleSwitch(
            totalSwitches: 3,
            initialLabelIndex: 2,
            multiLineText: true,
          ),
        ),
      ),
    );
    final widget = tester.widget<ToggleSwitch>(find.byType(ToggleSwitch));
    expect(widget.multiLineText, equals(true));
  });

  testWidgets('Can disable switch', (WidgetTester tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: new MediaQueryData(),
        child: MaterialApp(
          home: ToggleSwitch(
            totalSwitches: 3,
            initialLabelIndex: 2,
            states: [true, false, true],
          ),
        ),
      ),
    );
    final widget = tester.widget<ToggleSwitch>(find.byType(ToggleSwitch));
    expect(widget.states![0], equals(true));
    expect(widget.states![1], equals(false));
  });

  testWidgets('Can add custom widgets', (WidgetTester tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: new MediaQueryData(),
        child: MaterialApp(
          home: ToggleSwitch(
            initialLabelIndex: 1,
            customWidgets: [
              Text('Hello'),
              Text('Flutter'),
            ],
          ),
        ),
      ),
    );
    final helloTextFinder = find.text('Hello');
    final flutterTextFinder = find.text('Flutter');
    expect(helloTextFinder, findsOneWidget);
    expect(flutterTextFinder, findsOneWidget);
  });
}
