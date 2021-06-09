import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Center(
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
                    totalSwitches: 3,
                    labels: ['America', 'Canada', 'Mexico'],
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Basic toggle switch with custom height and font size:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ToggleSwitch(
                    minWidth: 90.0,
                    minHeight: 90.0,
                    fontSize: 16.0,
                    initialLabelIndex: 1,
                    activeBgColor: [Colors.green],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.grey[900],
                    totalSwitches: 3,
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
                    activeBgColor: [Colors.cyan],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
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
                    totalSwitches: 2,
                    labels: ['Male', 'Female'],
                    icons: [FontAwesomeIcons.mars, FontAwesomeIcons.venus],
                    activeBgColors: [
                      [Colors.blue],
                      [Colors.pink]
                    ],
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'With border color, border width, icons, custom height and different active background colors:',
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
                    totalSwitches: 3,
                    icons: [
                      FontAwesomeIcons.mars,
                      FontAwesomeIcons.venus,
                      FontAwesomeIcons.transgender
                    ],
                    iconSize: 30.0,
                    borderWidth: 2.0,
                    borderColor: [Colors.blueGrey],
                    activeBgColors: [
                      [Colors.blue],
                      [Colors.pink],
                      [Colors.purple]
                    ],
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'With gradient border color, divider color and gradient active background colors:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ToggleSwitch(
                    minWidth: 90.0,
                    minHeight: 70.0,
                    initialLabelIndex: 0,
                    cornerRadius: 20.0,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 3,
                    icons: [
                      FontAwesomeIcons.facebook,
                      FontAwesomeIcons.twitter,
                      FontAwesomeIcons.instagram
                    ],
                    iconSize: 30.0,
                    borderColor: [
                      Color(0xff3b5998),
                      Color(0xff8b9dc3),
                      Color(0xff00aeff),
                      Color(0xff0077f2),
                      Color(0xff962fbf),
                      Color(0xff4f5bd5)
                    ],
                    dividerColor: Colors.blueGrey,
                    activeBgColors: [
                      [Color(0xff3b5998), Color(0xff8b9dc3)],
                      [Color(0xff00aeff), Color(0xff0077f2)],
                      [
                        Color(0xfffeda75),
                        Color(0xfffa7e1e),
                        Color(0xffd62976),
                        Color(0xff962fbf),
                        Color(0xff4f5bd5)
                      ]
                    ],
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'With bounceInOut animation:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ToggleSwitch(
                    minWidth: 90.0,
                    minHeight: 70.0,
                    initialLabelIndex: 0,
                    cornerRadius: 20.0,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    icons: [
                      FontAwesomeIcons.lightbulb,
                      FontAwesomeIcons.solidLightbulb,
                    ],
                    iconSize: 30.0,
                    activeBgColors: [
                      [Colors.black45, Colors.black26],
                      [Colors.yellow, Colors.orange]
                    ],
                    animate:
                        true, // with just animate set to true, default curve = Curves.easeIn
                    curve: Curves
                        .bounceInOut, // animate must be set to true when using custom curve
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'With radius style:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ToggleSwitch(
                    minWidth: 90.0,
                    cornerRadius: 20.0,
                    activeBgColors: [
                      [Colors.green[800]!],
                      [Colors.red[800]!]
                    ],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    initialLabelIndex: 1,
                    totalSwitches: 2,
                    labels: ['True', 'False'],
                    radiusStyle: true,
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
