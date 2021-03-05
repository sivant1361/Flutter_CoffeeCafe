import 'package:coffeecafebrew/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleVal;
  Register({this.toggleVal});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: Center(child: Text('Sign Up to Coffee Crew')),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  widget.toggleVal();
                },
                icon: Icon(Icons.person),
                label: Text("Signin"))
          ]),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
          child: Form(
              child: Column(children: <Widget>[
            SizedBox(height: 20),
            TextFormField(onChanged: (val) {
              setState(() => email = val);
            }),
            SizedBox(height: 20),
            TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                }),
            SizedBox(height: 20),
            RaisedButton(
                color: Colors.pink[400],
                child: Text("Register", style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  print(email + ":" + password);
                })
          ]))),
    );
  }
}
