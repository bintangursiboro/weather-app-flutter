import 'package:flutter/material.dart';
import 'package:tugas/bloc/weather_state.dart';
import 'package:tugas/data/sqflite_data.dart';
import 'package:tugas/page/weather_info_box.dart';

class WeatherView extends StatefulWidget {
  WeatherState weatherState;
  WeatherSQL weatherSQL;
  WeatherView({this.weatherState, this.weatherSQL});
  @override
  _WeatherViewState createState() =>
      _WeatherViewState(weatherState: weatherState, weatherSQL: weatherSQL);
}

class _WeatherViewState extends State<WeatherView> {
  WeatherState weatherState;
  WeatherSQL weatherSQL;
  _WeatherViewState({this.weatherState, this.weatherSQL});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: (weatherState is WeatherLoaded)
          ? WeatherInfoBox(
              dataWeather: (weatherState as WeatherLoaded).dataWeather,
            )
          : ((weatherSQL != null)
              ? WeatherInfoBox(weatherSQL: weatherSQL)
              : WeatherInfoBox()),
    ));
  }
}
