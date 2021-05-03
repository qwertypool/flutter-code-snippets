import 'package:flutter/material.dart';
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}
class _LoginFormState extends State<LoginForm> {
  bool _isHidden = true;
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: Center(
        child: TextField(
            obscureText: _isHidden,
            decoration: InputDecoration(
            hintText: 'Password',
            suffix: InkWell(
                onTap: _togglePasswordView,
                child: Icon(
                        _isHidden 
                        ? Icons.visibility 
                        : Icons.visibility_off,
                    ),
                ),
            ),
        ),
      ),
    );
  }
void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
