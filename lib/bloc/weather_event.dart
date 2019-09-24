import 'package:equatable/equatable.dart';

class WeatherEvent extends Equatable {
  WeatherEvent([List props = const []]) : super(props);
}

class FetchWeather extends WeatherEvent {
  String cityName;

  FetchWeather({this.cityName}) : super([cityName]);
}
