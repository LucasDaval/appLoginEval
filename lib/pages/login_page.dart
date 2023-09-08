import 'package:flutter/material.dart';

import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: LoginForm(),
        ),
      ),
    );
  }
}
