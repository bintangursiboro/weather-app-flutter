import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas/bloc/weather_bloc.dart';
import 'package:tugas/bloc/weather_event.dart';
import 'package:tugas/bloc/weather_state.dart';
import 'package:tugas/di/injector.dart';
import 'package:tugas/page/weather_view.dart';

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Application'),
      ),
      body: WeatherSub(),
    );
  }
}

class WeatherSub extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<WeatherSub> {
  WeatherBloc _weatherBloc;
  String text;
  @override
  void initState() {
    super.initState();
    _weatherBloc = WeatherBloc();
    text = "";
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: _weatherBloc,
      builder: (BuildContext context, WeatherState state) {
        return Container(
          color: Colors.transparent,
          child: Column(
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  setState(() {
                    text = value;
                  });
                },
              ),
              OutlineButton(
                color: Colors.lightBlue,
                onPressed: () {
                  // print('Clicked');
                  _weatherBloc.dispatch(FetchWeather(cityName: this.text));
                },
                child: Text(
                  'Cari',
                  style: TextStyle(color: Colors.lightBlue),
                ),
              ),
              (state is WeatherLoaded)
                  ? WeatherView(
                      weatherState: state,
                    )
                  : ((state is Uninitialized)
                      ? Text('')
                      : ((state is WeatherError)
                          ? WeatherView(
                              weatherSQL: state.weatherSQL,
                            )
                          : Text(''))),
            ],
          ),
        );
      },
    );
  }
}
