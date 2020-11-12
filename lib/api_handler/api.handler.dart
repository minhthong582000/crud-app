import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_form/model/credentials.model.dart';

final _base = "http://10.0.2.2:3000/api/v1";
final _tokenEnpoint = '/auth/login/';
final _authEndpoint = _base + _tokenEnpoint;

Future<Token> getToken(LoginCredential loginCredentials) async {
  print(_tokenEnpoint);

  final http.Response response = await http.post(_authEndpoint,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(loginCredentials.toDatabaseJson()));

  if (response.statusCode == 200) {
    return Token.fromJson(json.decode(response.body));
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}
