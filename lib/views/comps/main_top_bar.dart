import 'package:flutter/material.dart';

class MainTopBar extends AppBar {
  final BuildContext context;
  final Widget title;  
  final VoidCallback logoutPressed;  

  MainTopBar({Key key, this.context, this.title, this.logoutPressed}) : 
    super(key: key, 
          title: title, 
          leading: Builder(
            builder: (context) => IconButton(icon: new Icon(Icons.menu), 
                                             onPressed: () => Scaffold.of(context).openDrawer()),
          ),
          backgroundColor: Colors.indigo[600],
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.power_settings_new),
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: new Text("Та програмаас гарах гэж байна."),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text("Үгүй"),
                          onPressed: () { Navigator.of(context).pop(); },
                        ),
                        new FlatButton(
                          child: new Text("Тийм"),
                          onPressed: logoutPressed,
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
    );    
}