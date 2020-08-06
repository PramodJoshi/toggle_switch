# Toggle Switch

A simple toggle switch widget. It can be fully customized with desired icons, width, colors, text, corner radius etc. It also maintains selection state.

## Getting Started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  toggle_switch: "^0.1.7"
```

Import it:

```dart
import 'package:toggle_switch/toggle_switch.dart';
```

## Usage Examples

### Basic toggle switch

```dart
// Here default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
ToggleSwitch(
  initialLabelIndex: 0,
  labels: ['America', 'Canada', 'Mexico'],
  onToggle: (index) {
    print('switched to: $index');
  },
),
```

![Basic toggle switch](https://media.giphy.com/media/QX1jcEQH5PnxL7l7Lh/giphy.gif)

### Basic toggle switch with custom height and font size

```dart
ToggleSwitch(
  minWidth: 90.0,
  minHeight: 90.0,
  fontSize: 16.0,
  initialLabelIndex: 1,
  activeBgColor: Colors.green,
  activeFgColor: Colors.white,
  inactiveBgColor: Colors.grey,
  inactiveFgColor: Colors.grey[900],
  labels: ['Tall', 'Grande', 'Venti'],
  onToggle: (index) {
    print('switched to: $index');
  },
),
```

![Basic toggle switch with custom height](https://media.giphy.com/media/Jrf2KLuWJVaB4cIwlz/giphy.gif)

### With icons and text

```dart
ToggleSwitch(
  minWidth: 90.0,
  cornerRadius: 20.0,
  activeBgColor: Colors.cyan,
  activeFgColor: Colors.white,
  inactiveBgColor: Colors.grey,
  inactiveFgColor: Colors.white,
  labels: ['YES', 'NO'],
  icons: [FontAwesomeIcons.check, FontAwesomeIcons.times],
  onToggle: (index) {
    print('switched to: $index');
  },
),
```

![With icons and text](https://media.giphy.com/media/SwyiW7VtVf4z1UZviS/giphy.gif)

### With icons, text and different active background colors

```dart
ToggleSwitch(
  minWidth: 90.0,
  initialLabelIndex: 1,
  cornerRadius: 20.0,
  activeFgColor: Colors.white,
  inactiveBgColor: Colors.grey,
  inactiveFgColor: Colors.white,
  labels: ['Male', 'Female'],
  icons: [FontAwesomeIcons.mars, FontAwesomeIcons.venus],
  activeBgColors: [Colors.blue, Colors.pink],
  onToggle: (index) {
    print('switched to: $index');
  },
),
```

![With icons, text and different active background colors](https://media.giphy.com/media/ih4qpWz1wqqILVWYiT/giphy.gif)

### With icons, custom height and different active background colors

```dart
ToggleSwitch(
  minWidth: 90.0,
  minHeight: 70.0,
  initialLabelIndex: 2,
  cornerRadius: 20.0,
  activeFgColor: Colors.white,
  inactiveBgColor: Colors.grey,
  inactiveFgColor: Colors.white,
  labels: ['', '', ''],
  icons: [
    FontAwesomeIcons.mars,
    FontAwesomeIcons.venus,
    FontAwesomeIcons.transgender
  ],
  iconSize: 30.0,
  activeBgColors: [Colors.blue, Colors.pink, Colors.purple],
  onToggle: (index) {
    print('switched to: $index');
  },
),
```

![With icons, custom height and different active background colors](https://media.giphy.com/media/JT8P80R2uNgguIT3i2/giphy.gif)

## Credits

[Eugene](https://stackoverflow.com/questions/56340682/flutter-equvalent-android-toggle-switch)