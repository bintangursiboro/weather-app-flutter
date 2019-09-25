import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tugas/data/sqflite_data.dart';
import 'package:tugas/data/weather_model.dart';

class WeatherInfoBox extends StatefulWidget {
  DataWeather dataWeather;
  WeatherSQL weatherSQL;
  WeatherInfoBox({this.dataWeather, this.weatherSQL});

  @override
  _WeatherInfoBoxState createState() =>
      _WeatherInfoBoxState(dataWeather: dataWeather, weatherSQL: weatherSQL);
}

class _WeatherInfoBoxState extends State<WeatherInfoBox> {
  DataWeather dataWeather;
  WeatherSQL weatherSQL;
  int counter = 0;
  _WeatherInfoBoxState({this.dataWeather, this.weatherSQL});
  @override
  Widget build(BuildContext context) {
    return (dataWeather != null)
        ? Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              border: Border.all(
                color: Colors.lightBlueAccent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              shape: BoxShape.rectangle,
            ),
            child: Column(
              children: <Widget>[
                showImage(dataWeather.weather[0].icon),
                Text("City: " + dataWeather.name),
                Text('Wind: ' + dataWeather.wind.speed.toString() + ' km/s'),
                Text('Humidity: ' + dataWeather.main.humidity.toString() + '%')
              ],
            ),
          )
        : ((weatherSQL != null)
            ? Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  border: Border.all(
                    color: Colors.lightBlueAccent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  children: <Widget>[
                    // showImage(weatherSQL.weather[0].icon),
                    Text("City: " + weatherSQL.name),
                    Text('Wind: ' + weatherSQL.wind.toString() + ' km/h'),
                    Text('Humidity: ' + weatherSQL.humidity.toString() + '%')
                  ],
                ),
              )
            : showIfNull());
  }

  Widget showImage(String picString) {
    return Image.network("http://openweathermap.org/img/wn/$picString@2x.png");
  }

  Widget showIfNull() {
    print(counter++);
    MethodChannel("toast.flutter.io/toast").invokeMethod("showToast");
    return Text('Cuaca kota tidak ditemukan');
  }
}
