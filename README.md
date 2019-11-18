# Toggle Switch

A simple toggle switch widget. It can be fully customized - width, colors, text, corner radius etc. It maintains selection state on scroll.

## Getting Started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  flutter_sticky_header: "0.1.1"
```

Import it:

```dart
import 'package:toggle_switch/toggle_switch.dart';
```

## Usage

Example 1:

```
import 'package:flutter/material.dart';

import 'package:toggle_switch/toggle_switch.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleSwitch(
                minWidth: 90.0,
                initialLabel: 2,
                activeBgColor: Colors.redAccent,
                activeTextColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveTextColor: Colors.grey[900],
                labels: ['America', 'Canada', 'Mexico'],
                onToggle: (index) {
                  print('switched to: $index');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

```
