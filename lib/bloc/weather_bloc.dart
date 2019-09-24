import 'package:bloc/bloc.dart';
import 'package:tugas/bloc/weather_state.dart';
import 'package:tugas/data/db.dart';
import 'package:tugas/data/network.dart';
import 'package:tugas/data/sqflite_data.dart';
import 'package:tugas/data/weather_model.dart';
import 'package:tugas/di/di.dart';

import 'weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  @override
  get initialState => Uninitialized();

  NetworkCall networkCall = NetworkCall();
  NetworkCall netCall = KiwiInject().getNetworkCall();
  DBProvider dbProvider = KiwiInject().getDBProvider();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      try {
        yield WeatherLoading();

        DataWeather dataWeather = await netCall.getWeather(event.cityName);
        var currState = WeatherLoaded();

        if (dataWeather.name != null) {
          yield currState.copyWith(dataWeather: dataWeather);
          if (dataWeather != null) {
            dbProvider.newWeather(WeatherSQL(
                id: 1,
                name: dataWeather.name,
                wind: dataWeather.wind.speed,
                humidity: dataWeather.main.humidity));
          }
        } else {
          WeatherSQL weatherSQL =
              await dbProvider.getWeatherSQL(event.cityName);
          if (weatherSQL != null) {
            var currentState = WeatherError(weatherSQL: weatherSQL);
            yield currentState.copyWith(weatherSQL: weatherSQL);
          } else {
            yield WeatherError(error: "Lokasi tidak dapat ditemukan");
          }
        }

        print('still good');
      } catch (_) {
        WeatherSQL weatherSQL = await dbProvider.getWeatherSQL(event.cityName);
        if (weatherSQL == null) {
          print('ERROR NULL NIHHH');
          yield WeatherError();
        } else {
          print('object: ' + weatherSQL.name);
          yield WeatherError(error: _, weatherSQL: weatherSQL);
          print('here error' + _);
        }
      }
    }
  }
}
