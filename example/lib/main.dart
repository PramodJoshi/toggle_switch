import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Basic toggle switch:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ToggleSwitch(
                initialLabelIndex: 0,
                labels: ['America', 'Canada', 'Mexico'],
                onToggle: (index) {
                  print('switched to: $index');
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Basic toggle switch with custom height:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'With icons and text:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'With icons, text and different active background colors:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'With icons, custom height and different active background colors:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
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
              ToggleSwitch(
                minWidth: 90.0,
                minHeight: 70.0,
                initialLabelIndex: 2,
                cornerRadius: 20.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                labels: ['first', 'second', 'third'],
                boarderWidth: 2.0,
                boarderColor: Colors.yellow,
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
            ],
          ),
        )),
      ),
    );
  }
}
