import 'package:login_form/database/user.dart';
import 'package:login_form/model/user.model.dart';

class UserDAO {
  final dbProvider = DatabaseProvider.dbProvider;

  Future<int> storeUser(User user) async {
    final db = await dbProvider.database;

    var result = db.insert(userTable, user.toDatabaseJson());
    return result;
  }

  Future<int> deleteUser(int id) async {
    final db = await dbProvider.database;

    var result = await db.delete(userTable, where: "id = ?", whereArgs: [id]);
    return result;
  }

  Future<bool> checkUser(int id) async {
    final db = await dbProvider.database;

    try {
      List<Map> users =
          await db.query(userTable, where: 'id = ?', whereArgs: [id]);

      if (users.length > 0) {
        return true;
      }

      return false;
    } catch (err) {
      return false;
    }
  }
}
