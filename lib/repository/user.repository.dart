import 'dart:async';
import 'package:login_form/api_handler/api.handler.dart';
import 'package:login_form/dao/user.dao.dart';
import 'package:login_form/model/credentials.model.dart';
import 'package:login_form/model/user.model.dart';
import 'package:meta/meta.dart';

class UserRepository {
  final userDao = UserDAO();

  Future<User> authenticate({
    @required String username,
    @required String password,
  }) async {
    LoginCredential userLogin =
        LoginCredential(username: username, password: password);
    Token token = await getToken(userLogin);
    User user = User(
      id: 0,
      username: username,
      token: token.token,
    );
    return user;
  }

  Future<void> persistToken({@required User user}) async {
    // write token with the user to the database
    await userDao.storeUser(user);
  }

  Future<void> deleteToken({@required int id}) async {
    await userDao.deleteUser(id);
  }

  Future<bool> hasToken() async {
    bool result = await userDao.checkUser(0);
    return result;
  }
}
