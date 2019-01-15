import 'package:flutter/material.dart';
import 'package:artlab/views/index.dart';
import 'package:artlab/views/main_page.dart';
import 'package:artlab/views/login_page.dart';
import 'package:artlab/views/settings_page.dart';
import 'package:artlab/views/help_page.dart';

void main() { 
  runApp(ArtlabApp());
}

class ArtlabApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Artlab Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.indigo[600],
        accentColor: Colors.indigo,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.grey[900],
          displayColor: Colors.grey,
        ), 
      ),
      initialRoute: "/",
      routes: <String, WidgetBuilder>{
        "/"         : (BuildContext context) => IndexPage(), 
        "/main"     : (BuildContext context) => MainPage(),
        "/login"    : (BuildContext context) => LoginPage(),
        "/settings" : (BuildContext context) => SettingsPage(),
        "/help"     : (BuildContext context) => HelpPage(),
      },
            
    );
  }

}