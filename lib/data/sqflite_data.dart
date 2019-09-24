class WeatherSQL {
  int id;
  String name;
  num humidity;
  num wind;

  WeatherSQL({this.id, this.name, this.humidity, this.wind});

  factory WeatherSQL.fromMap(Map<String, dynamic> json) => new WeatherSQL(
        id: json["id"],
        name: json["name"],
        humidity: json["humidity"],
        wind: json["wind"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "humidity": humidity,
        "wind": wind,
      };
}
