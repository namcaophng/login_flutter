import 'package:login/core/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

class UserDAO {
  static late Database? database;

  Future<Database> open() async {
    if (database == null) {
      var databasePath = await getDatabasesPath();
      String path = databasePath + 'login.db';

      database = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
            await db.execute(
                "CREATE TABLE IF NOT EXISTS $tableName ($id INTEGER PRIMARY KEY, "
                    "$account TEXT UNIQUE, $password TEXT, $name TEXT);");
          }
      );
    }
    return database!;
  }

  Future<bool> saveUser(UserModel user) async {
    Database db = await open();

    var map = Map<String, dynamic>();
    map[name] = user.name;
    map[account] = user.account;
    map[password] = user.password;

    var result = await db.insert(tableName, map,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result != 0;
  }

  Future<UserModel?> getUser(String userName) async {
    Database db = await open();

    List<Map<String, dynamic>> results = await db.query(tableName,
        where: "${this.account} LIKE '$userName'", limit: 1);
    if (results.length == 0) {
      return null;
    } else {
      var result = results[0];
      return getUserRaw(result);
    }
  }

  UserModel getUserRaw(Map<String, dynamic> result) {
    return UserModel(
        name: result[name],
        account: result[account],
        password: result[password]
    );
  }

  Future<List<UserModel>> getAllUsers() async {
    Database db = await open();

    List<Map<String, dynamic>> results =
    await db.query(tableName, orderBy: "$id DESC");
    List<UserModel> users = [];
    for (Map<String, dynamic> result in results) {
      users.add(getUserRaw(result));
    }
    return users;
  }

  // Future<int> removeWeather(UserModel user) async {
  //   Database database = await open();
  //   int result = await database
  //       .rawDelete("DELETE FROM $tableName WHERE $id = ${user.id};");
  //   return result;
  // }

  final String tableName = 'table_user';

  final String id = 'user_id';
  final String account = 'user_account';
  final String password = 'user_password';
  final String name = 'user_name';

}
