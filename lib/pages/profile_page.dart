import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  final int id;
  const ProfilePage({super.key, required this.username, required this.id});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bonjour ' + widget.username,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: widget.username,
                border: OutlineInputBorder(),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: widget.id.toString(),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => print('enregistré'),
                  child: Text(
                    'Enregistrer',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => print('updated'),
                  child: Text('Update', style: TextStyle(fontSize: 24)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
