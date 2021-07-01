import 'package:login/core/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

class UserDAO {
  static late Database? database;

  Future<Database> open() async {
    if (database == null) {
      var databasePath = await getDatabasesPath();
      String path = databasePath + 'weather.db';

      database = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
            await db.execute(
                "CREATE TABLE IF NOT EXISTS $tableName ($id INTEGER PRIMARY KEY, "
                    "$userName TEXT, $password TEXT);");
          }
      );
    }
    return database!;
  }

  Future<int> saveWeather(UserModel user) async {
    Database db = await open();

    var map = Map<String, dynamic>();
    map[id] = user.id;
    map[userName] = user.account;
    map[password] = user.password;

    var result = await db.insert(tableName, map,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future<UserModel?> getUser(String userName) async {
    Database db = await open();

    List<Map<String, dynamic>> results = await db.query(tableName,
        where: "${this.userName} LIKE '$userName'", limit: 1);
    if (results.length == 0) {
      return null;
    } else {
      var result = results[0];
      return getWeatherFromRaw(result);
    }
  }

  Weather getWeatherFromRaw(Map<String, dynamic> result) {
    return Weather(
        result[id],
        result[this.location],
        result[main],
        result[des],
        result[temp],
        result[pressure],
        result[humidity],
        result[tempMin],
        result[tempMax],
        result[lastUpdated],
        favorite: result[favorite] == 1 ? true : false);
  }

  Future<List<Weather>> getWeathers() async {
    Database db = await open();

    List<Map<String, dynamic>> results =
    await db.query(tableName, orderBy: "$lastUpdated DESC");
    List<Weather> weathers = [];
    for (Map<String, dynamic> result in results) {
      weathers.add(getWeatherFromRaw(result));
    }
    return weathers;
  }

  Future<List<Weather>> getWeathersFavorite() async {
    Database db = await open();
    List<Map<String, dynamic>> results = await db.query(
        tableName, where: "$favorite = 1");
    List<Weather> weathers = [];
    for (Map<String, dynamic> result in results) {
      weathers.add(getWeatherFromRaw(result));
    }
    return weathers;
  }

  Future<int> removeWeather(Weather weather) async {
    Database database = await open();
    int result = await database
        .rawDelete("DELETE FROM $tableName WHERE $id = ${weather.id};");
    return result;
  }

  final String tableName = 'table_user';

  final String id = 'user_id';
  final String userName = 'user_name';
  final String password = 'user_password';

}
