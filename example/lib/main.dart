import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  ToggleSwitch disablingToggleSwitch;

  @override
  Widget build( BuildContext context ) {

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 15.0
                ),
                child: Text(
                  'Basic toggle switch: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0
                  )
                ),
              ),
              ToggleSwitch(
                minWidth: 90.0,
                initialLabelIndex: 2,
                activeBgColor: Colors.redAccent,
                activeTextColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveTextColor: Colors.grey[900],
                labels: ['America', 'Canada', 'Mexico'],
                onToggle: (index) {
                  print('switched to: $index');
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                child: Text('With icons: ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
              ),
              ToggleSwitch(
                  minWidth: 90.0,
                  cornerRadius: 20,
                  activeBgColor: Colors.green,
                  activeTextColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveTextColor: Colors.white,
                  labels: ['YES', 'NO'],
                  icons: [FontAwesomeIcons.check, FontAwesomeIcons.times],
                  onToggle: (index) {
                    print('switched to: $index');
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                child: Text('With icons and different active colors: ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
              ),
              ToggleSwitch(
                  minWidth: 90.0,
                  cornerRadius: 20,
                  activeBgColor: Colors.green,
                  activeTextColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveTextColor: Colors.white,
                  labels: ['Male', 'Female'],
                  icons: [FontAwesomeIcons.mars, FontAwesomeIcons.venus],
                  activeColors: [Colors.blue, Colors.pink],
                  onToggle: (index) {
                    print('switched to: $index');
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                child: Text(
                    'Disabled',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0
                    )
                ),
              ),
              ToggleSwitch(
                  minWidth: 90.0,
                  cornerRadius: 20,
                  activeBgColor: Colors.green,
                  activeTextColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveTextColor: Colors.white,
                  disabled: true,
                  labels: [ 'First', 'Second' ],
                  icons: [ FontAwesomeIcons.users, FontAwesomeIcons.receipt ],
                  activeColors: [ Colors.amber, Colors.blueAccent ],
                  onToggle: ( index ) {
                    print( 'switched to: $index' );
                  }
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                child: Text(
                  'First and second indexes disabled: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0
                  )
                ),
              ),
              ToggleSwitch(
                minWidth: 90.0,
                cornerRadius: 20,
                activeBgColor: Colors.green,
                activeTextColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveTextColor: Colors.white,
                disabledIndexes: [ 0, 1 ],
                labels: [ 'First', 'Second', 'Third' ],
                icons: [ FontAwesomeIcons.mars, FontAwesomeIcons.venus, FontAwesomeIcons.child ],
                activeColors: [ Colors.blue, Colors.pink, Colors.red ],
                onToggle: ( index ) {
                  print( 'switched to: $index' );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
