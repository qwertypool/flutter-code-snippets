import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PasswordGeneratorScreen(),
    );
  }
}

class PasswordGeneratorScreen extends StatefulWidget {
  @override
  _PasswordGeneratorScreenState createState() => _PasswordGeneratorScreenState();
}

class _PasswordGeneratorScreenState extends State<PasswordGeneratorScreen> {
  String _generatedPassword = '';
  int _passwordLength = 10;

  void _generatePassword() {
    // Generate a random password of length _passwordLength
    final random = Random();
    const charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()_+-=';
    var password = '';
    for (var i = 0; i < _passwordLength; i++) {
      password += charset[random.nextInt(charset.length)];
    }

    setState(() {
      _generatedPassword = password;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Generate a random password:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                _generatedPassword,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'Password length:',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(width: 16),
                DropdownButton<int>(
                  value: _passwordLength,
                  onChanged: (value) {
                    setState(() {
                      _passwordLength = value!;
                    });
                  },
                  items: [
                    DropdownMenuItem(value: 8, child: Text('8')),
                    DropdownMenuItem(value: 10, child: Text('10')),
                    DropdownMenuItem(value: 12, child: Text('12')),
                    DropdownMenuItem(value: 16, child: Text('16')),
                    DropdownMenuItem(value: 20, child: Text('20')),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _generatePassword,
              child: Text('Generate'),
            ),
          ],
        ),
      ),
    );
  }
}
