import 'package:coffeecafebrew/screens/authenticate/signin.dart';
import 'package:coffeecafebrew/screens/authenticate/register.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignin = true;
  void toggleVal() {
    setState(() => showSignin = !showSignin);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignin) {
      return SignIn(toggleVal: toggleVal);
    } else {
      return Register(toggleVal: toggleVal);
    }
  }
}
