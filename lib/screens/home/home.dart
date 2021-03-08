import 'package:coffeecafebrew/models/brew.dart';
import 'package:coffeecafebrew/screens/home/brewList.dart';
import 'package:coffeecafebrew/screens/home/settingsForm.dart';
import 'package:coffeecafebrew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffeecafebrew/services/database.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                child: SettingsForm());
          });
    }

    return StreamProvider<List<Brew>>.value(
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
              ),
              FlatButton.icon(
                  onPressed: () => _showSettingsPanel(),
                  icon: Icon(Icons.settings),
                  label: Text("Settings"))
            ],
          ),
          body: Container(
            decoration:BoxDecoration(
              image:DecorationImage(
                image:AssetImage('assets/coffee_bg.png'),
                fit:BoxFit.cover
              )

            ),
            child: BrewList())),
    );
  }
}
