# Toggle Switch

A simple toggle switch widget. It can be fully customized - width, colors, text, corner radius etc. It maintains selection state on scroll.

## Getting Started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  flutter_sticky_header: "^0.1.2"
```

Import it:

```dart
import 'package:toggle_switch/toggle_switch.dart';
```

## Usage

Example 1:

```dart
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
![Example 1](https://media.giphy.com/media/kHkxHHpPkvVFOLB6Iq/giphy.gif)

Example 2:

```dart
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
                cornerRadius: 20,
                activeBgColor: Colors.green,
                activeTextColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveTextColor: Colors.white,
                labels: ['YES', 'NO'],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
![Example 2](https://media.giphy.com/media/U72TwlCo3tWSkqBunm/giphy.gif)

## Credits
[Eugene](https://stackoverflow.com/questions/56340682/flutter-equvalent-android-toggle-switch)