import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tugas/bloc/weather_bloc.dart';
import 'package:tugas/page/weather.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      title: 'Tugas',
      home: BlocProvider<WeatherBloc>(
        builder: (context) => WeatherBloc(),
        child: Weather(),
      ),
    );
  }
}
