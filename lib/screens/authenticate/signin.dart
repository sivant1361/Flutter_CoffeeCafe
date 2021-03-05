import 'package:coffeecafebrew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Center(child: Text('Sign In to Coffee Brew Crew')),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
          child: Form(
              child: Column(children: <Widget>[
            SizedBox(height: 20),
            TextFormField(onChanged: (val) {}),
            SizedBox(height: 20),
            TextFormField(obscureText: true, onChanged: (val) {}),
          ]))),
    );
  }
}
