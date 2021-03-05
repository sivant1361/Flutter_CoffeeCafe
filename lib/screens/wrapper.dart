import 'package:coffeecafebrew/models/user.dart';
import 'package:coffeecafebrew/screens/authenticate/authenticate.dart';
import 'package:coffeecafebrew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CusUser>(context);
    print(user);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
