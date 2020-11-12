class User {
  int id;
  String username;
  String token;

  User({this.id, this.username, this.token});

  // fromDatabaseJson which will return the user as a JSON object
  factory User.fromDatabaseJson(Map<String, dynamic> data) =>
      User(id: data['id'], username: data['username'], token: data['token']);

  // toDatabaseJson which will be responsible for converting the incoming JSON object to a database object which can be stored to our database.
  Map<String, dynamic> toDatabaseJson() =>
      {"id": this.id, "username": this.username, "token": this.token};
}
