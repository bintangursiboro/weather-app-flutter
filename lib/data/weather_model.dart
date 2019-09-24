class DataWeather {
  Coor coor;
  List<Weather> weather;
  String base;
  Main main;
  num visibility;
  Wind wind;
  Clouds clouds;
  num dt;
  Sys sys;
  num timezone;
  num id;
  String name;
  num cod;
  String error;

  DataWeather(
      this.coor,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod);

  DataWeather.fromJson(Map<String, dynamic> json)
      : coor = Coor.fromJson(json['coord']),
        weather = (json['weather'] as List)
            .map((f) => new Weather.fromJson(f))
            .toList(),
        base = json['base'],
        main = Main.fromJson(json['main']),
        visibility = json['visibillity'],
        wind = Wind.fromJson(json['wind']),
        clouds = Clouds.fromJson(json['clouds']),
        dt = json['dt'],
        sys = Sys.fromJson(json['sys']),
        timezone = json['timezone'],
        id = json['id'],
        name = json['name'],
        cod = json['cod'];

  DataWeather.withError(String error) : this.error = error;
}

class Coor {
  num lon;
  num lat;
  Coor(this.lon, this.lat);

  Coor.fromJson(Map<String, dynamic> json)
      : lon = json['lon'],
        lat = json['lat'];
}

class Weather {
  num id;
  String main;
  String description;
  String icon;

  Weather(this.id, this.main, this.description, this.icon);

  Weather.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        main = json['main'],
        description = json['description'],
        icon = json['icon'];
}

class Main {
  num temp;
  num pressure;
  num humidity;
  num temp_min;
  num temp_max;
  Main(this.temp, this.pressure, this.humidity, this.temp_min, this.temp_max);

  Main.fromJson(Map<String, dynamic> json)
      : temp = json['temp'],
        pressure = json['pressure'],
        humidity = json['humidity'],
        temp_min = json['temp_min'],
        temp_max = json['temp_max'];
}

class Wind {
  num speed;
  num deg;
  Wind({this.speed, this.deg});

  Wind.fromJson(Map<String, dynamic> json)
      : speed = json['speed'],
        deg = json['deg'];
}

class Clouds {
  num all;
  Clouds(this.all);
  Clouds.fromJson(Map<String, dynamic> json) : all = json['all'];
}

class Sys {
  num type;
  num id;
  num message;
  String country;
  num sunrise;
  num sunset;

  Sys(this.type, this.id, this.message, this.country, this.sunrise,
      this.sunset);

  Sys.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        id = json['id'],
        message = json['message'],
        country = json['country'],
        sunrise = json['sunrise'],
        sunset = json['sunset'];
}
