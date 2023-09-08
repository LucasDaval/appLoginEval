import 'package:flutter/material.dart';
import '../data_base/db.dart';
import '../pages/profile_page.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late int userId;
  final DatabaseHelper _dbHelper = DatabaseHelper();

  final usersTest = [
    User(id: 0, username: "lucas", password: "1234"),
    User(id: 0, username: "lucas2", password: "1234"),
    User(id: 0, username: "lucas3", password: "1234"),
    User(id: 0, username: "lucas4", password: "1234"),
  ];
  late String message;

  @override
  void initState() {
    super.initState();
    userId = 0;
    message = "";
  }

  Future<void> _handleLogin() async {
    setState(() {
      userId++;
    });
    String username = _usernameController.text;
    String password = _passwordController.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(username: username, id: userId),
      ),
    );

    final user = await _dbHelper.getUserByUsername(username);

    if (user == null) {
      return;
    }
    if (username != user.username || password != user.password) {
      setState(() {
        message = "Le mot de passe et ou le username sont incorrectes";
      });
    }
    // for (var user in usersTest) {
    //   print(username);
    //   print(user.username);
    //   if (username == user.username && password == user.password) {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => ProfilePage(username: username, id: userId),
    //       ),
    //     );
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                "Let's sign you in",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "Welcome back You've been missed !",
              style: TextStyle(),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            Text(
              message,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleLogin,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
