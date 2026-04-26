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

  // customWidths that exceed screen width should be scaled down proportionally,
  // preserving relative ratios without causing overflow.
  testWidgets('customWidths exceeding screen width are scaled proportionally',
      (WidgetTester tester) async {
    // Screen width: 400. customWidths total: 65 + 300 + 65 + 50 = 480,
    // so the widths should be scaled proportionally.
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(400, 800)),
        child: MaterialApp(
          home: Scaffold(
            body: ToggleSwitch(
              totalSwitches: 4,
              labels: const ['A', 'B', 'C', 'D'],
              customWidths: [65.0, 300.0, 65.0, 50.0], // total 480 > 400
              minWidth: double.maxFinite,
              onToggle: (_) {},
            ),
          ),
        ),
      ),
    );

    // Widget should render without overflow errors.
    expect(tester.takeException(), isNull);

    // All labels should be visible.
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
    expect(find.text('C'), findsOneWidget);
    expect(find.text('D'), findsOneWidget);

    // 'B' container (customWidth 300) should be wider than 'A' container (customWidth 65),
    // confirming proportional ratios are preserved after scaling.
    final containerA = find.ancestor(
        of: find.text('A'), matching: find.byType(AnimatedContainer));
    final containerB = find.ancestor(
        of: find.text('B'), matching: find.byType(AnimatedContainer));
    final widthA = tester.getSize(containerA.first).width;
    final widthB = tester.getSize(containerB.first).width;
    expect(widthB, greaterThan(widthA));
  });
}
