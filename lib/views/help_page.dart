import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  HelpPageState createState() => new HelpPageState();
}

class HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Тусламж"),),
      body: Center(
        child: Text("Help page..."),
      ),
    );
  }
}