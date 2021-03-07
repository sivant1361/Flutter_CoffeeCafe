import 'package:coffeecafebrew/services/auth.dart';
import 'package:coffeecafebrew/shared/constants.dart';
import 'package:coffeecafebrew/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleVal;
  Register({this.toggleVal});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
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
                    key: _formKey,
                    child: Column(children: <Widget>[
                      SizedBox(height: 20),
                      TextFormField(
                          decoration:
                              textInputDecorations.copyWith(hintText: "Email"),
                          validator: (val) =>
                              val.isEmpty ? "Enter a email" : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          }),
                      SizedBox(height: 20),
                      TextFormField(
                          obscureText: true,
                          decoration: textInputDecorations.copyWith(
                              hintText: "Password"),
                          validator: (val) => val.length < 6
                              ? "Password should be at least 6 characters"
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          }),
                      SizedBox(height: 20),
                      RaisedButton(
                          color: Colors.pink[400],
                          child: Text("Register",
                              style: TextStyle(color: Colors.white)),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                loading = true;
                              });
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password);
                              // print(result);
                              if (result == null) {
                                setState(() {
                                  error = "Enter a valid email";
                                  loading = false;
                                });
                              }
                            }
                          }),
                      SizedBox(height: 20),
                      Text(error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0))
                    ]))),
          );
  }
}
