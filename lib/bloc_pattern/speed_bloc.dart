import 'dart:async';

import 'package:bloc_pattern/bloc_pattern/speed_event.dart';

class SpeedBloc {
  // _speed is the state variable whose state(value) changes based on events.
  int _speed = 0;

  // * This controller handles the incoming events. It accepts data of type
  // SpeedEvent.

  // * This is your input data handler.

  final StreamController<SpeedEvent> _eventController =
      StreamController<SpeedEvent>();

  // * This controller handles the outgoing events. It essentially sends out
  // your car's speed based on the event received from _eventController.

  // * This is your output data handler.
  final StreamController<int> _stateController = StreamController<int>();

  // Let's drop in some public getters

  // Read current speed from this stream
  Stream<int> get speedStream => _stateController.stream;

  // Write events to this sink
  StreamSink<SpeedEvent> get eventSink => _eventController.sink;

  // Let's drop in some private getters to be used within this file

  // Write speed changes to this sink
  StreamSink<int> get _stateSink => _stateController.sink;

  // Read events from this stream.
  Stream<SpeedEvent> get _eventStream => _eventController.stream;

  // Contructor
  SpeedBloc() {
    // Add listener to the event stream.
    _eventStream.listen(_mapEventToState);
  }

  void _mapEventToState(SpeedEvent event) {
    // A simple listener method (just a normal function)

    // Increments _speed by 10 is the received event is SpeedUpEvent otherwise
    // does vice versa.

    if (event is SpeedUpEvent) {
      _speed += 10;
    } else {
      _speed -= 10;
    }

    if (_speed < 0) {
      // because negative speed makes no sense!
      _speed = 0;
    }

    // add the update value of the _speed to the _stateController via its sink.

    _stateSink.add(_speed);
  }

  void dispose() {
    // *** Very important to avoid memeory leaks. 
    // Close all controllers after use. 
    // *** DO NOT NEGLECT THIS ***
    _stateController.close();
    _eventController.close();
  }
}
