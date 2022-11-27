abstract class Routes {
  Routes._();
  static const checkIn = _Paths.checkIn;
  static const schedule = _Paths.schedule;
}

abstract class _Paths {
  _Paths._();
  static const checkIn = '/check-in';
  static const schedule = '/schedule';
}
