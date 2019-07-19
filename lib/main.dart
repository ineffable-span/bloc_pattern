import 'package:bloc_pattern/bloc_pattern/speed_bloc.dart' show SpeedBloc;
import 'package:flutter/material.dart';

import 'bloc_pattern/speed_event.dart';

void main() => runApp(CarAcceleratorApp());

class CarAcceleratorApp extends StatelessWidget {
  // Declare and initialize a BLoC var.
  final SpeedBloc _speedBloc = SpeedBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Car Accelerator App'),
        ),
        body: StreamBuilder(
          stream: _speedBloc.speedStream,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot snapshot) => Container(
            child: Center(
              child: Text('Your car\'s speed is ${snapshot.data}'),
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () => _speedBloc.eventSink.add(SpeedUpEvent()),
              child: Text('UP'),
            ),
            SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () => _speedBloc.eventSink.add(SpeedDownEvent()),
              child: Text('DOWN'),
            )
          ],
        ),
      ),
    );
  }
}
