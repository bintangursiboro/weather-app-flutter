import 'package:equatable/equatable.dart';
import 'package:tugas/data/sqflite_data.dart';
import 'package:tugas/data/weather_model.dart';

class WeatherState extends Equatable {
  WeatherState([List props = const []]) : super(props);
}

class Uninitialized extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final DataWeather dataWeather;
  WeatherLoaded({this.dataWeather}) : super([dataWeather]);
  WeatherLoaded copyWith({DataWeather dataWeather}) {
    return WeatherLoaded(dataWeather: dataWeather ?? this.dataWeather);
  }
}

class WeatherError extends WeatherState {
  var error;
  WeatherSQL weatherSQL;
  WeatherError({this.error, this.weatherSQL}) : super([error, weatherSQL]);
  WeatherError copyWith({WeatherSQL weatherSQL}) {
    return WeatherError(weatherSQL: weatherSQL ?? this.weatherSQL);
  }
}
