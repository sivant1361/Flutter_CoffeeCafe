import 'package:coffeecafebrew/screens/home/brewList.dart';
import 'package:coffeecafebrew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeecafebrew/services/database.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().brews,
      child: Scaffold(
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            title: Text("Coffee Cafe"),
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                onPressed: () async {
                  await AuthService().signOut();
                },
                icon: Icon(Icons.person),
                label: Text("Logout"),
              )
            ],
          ),
          body: BrewList()),
    );
  }
}
