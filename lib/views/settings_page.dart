import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPageState createState() => new SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Тохиргоо"),),
      body: Center(
        child: Text("Settings page..."),
      ),
    );
  }
}