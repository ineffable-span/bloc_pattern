// Generic class to be used as event type parameter later under
// stream-controllers
abstract class SpeedEvent {}

// SpeedUpEvent signifies increase in speed
class SpeedUpEvent extends SpeedEvent {}

// SpeedDownEvent signifies decrease in speed
class SpeedDownEvent extends SpeedEvent {}
