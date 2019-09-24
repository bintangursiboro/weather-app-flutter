import 'package:dio/dio.dart';
import 'package:tugas/data/weather_model.dart';

class NetworkCall {
  final String _endPoint = "http://api.openweathermap.org/data/2.5/weather";
  final String _apiKey = "ef901613820a378bb42aa659aeadf38c";
  final Dio _dio = Dio();

  Future<DataWeather> getWeather(String _namaKota) async {
    try {
      Response response = await _dio
          .get(_endPoint, queryParameters: {"q": _namaKota, "APPID": _apiKey});
      return DataWeather.fromJson(response.data);
    } catch (error, stacktrace) {
      return DataWeather.withError(error.toString());
    }
  }
}
