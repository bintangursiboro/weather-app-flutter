import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tugas/data/sqflite_data.dart';

class DBProvider {
  DBProvider._();
  DBProvider();
  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path + "Weather.db";
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Weather ("
          "name TEXT PRIMARY_KEY,"
          "wind INTEGER,"
          "humidity INTEGER)");
    });
  }

  newWeather(WeatherSQL weatherSQL) async {
    final db = await database;
    db.delete("Weather", where: "name = ?", whereArgs: [weatherSQL.name]);
    var res = await db.rawInsert("INSERT INTO Weather (name,wind,humidity)"
        "VALUES (\"${weatherSQL.name}\", ${weatherSQL.wind}, ${weatherSQL.humidity})");
    print('Succed to save ${weatherSQL.name}');

    return res;
  }

  getWeatherSQL(String cityName) async {
    final db = await database;
    var res =
        await db.query("Weather", where: "name = ?", whereArgs: [cityName]);
    return res.isNotEmpty ? WeatherSQL.fromMap(res.first) : null;
  }

  updateClient(WeatherSQL weatherSQL) async {
    final db = await database;
    var res = await db.update("Weather", weatherSQL.toMap(),
        where: "name = ?", whereArgs: [weatherSQL.name]);
    print('Succed');
    return res;
  }
}
