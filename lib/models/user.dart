class User {
  int id;
  String username;
  String password;

  User({
    required this.id,
    required this.username,
    required this.password,
  });

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      id: data['id'],
      username: data['username'],
      password: data['password'],
    );
  }

  // Convert a User object to a map (used when storing data in the database)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
    };
  }
}
