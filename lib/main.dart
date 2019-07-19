import 'package:flutter/material.dart';

void main() => runApp(CarAcceleratorApp());

class CarAcceleratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Car Accelerator App'),
        ),
        body: Container(
          child: Center(
            child: Text(
              'Your car speed is 0',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {},
              child: Text('UP'),
            ),
            SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () {},
              child: Text('DOWN'),
            )
          ],
        ),
      ),
    );
  }
}
