import 'dart:async';
import "package:flutter/material.dart";
import 'package:artlab/util/preferences.dart';
import 'package:artlab/logic/auth_logic.dart';

class IndexPage extends StatefulWidget {  
  IndexPage({Key key}) : super(key : key);
  IndexPageState createState() => new IndexPageState();  
}

class IndexPageState extends State<IndexPage> {  
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<Null> _ppp () async {
    this.setState(() {
      String _token = Preferences.getStr('token');
      AuthLogic.check1(_token).then((bool logged) {
        print('logged: ' + logged.toString());
        if (logged) {
          Navigator.of(_scaffoldKey.currentContext).pushReplacementNamed('/main');
        } else {
          Navigator.of(_scaffoldKey.currentContext).pushReplacementNamed('/login');
        }
      });
    });
  }

  @override
	void initState() {
		super.initState();
    print('index init...');

    this._ppp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.indigo[600],
      body: new Center(                
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,          
          children: <Widget>[
            Text("Artlab cloud ERP", style: TextStyle(fontSize: 30, color: Colors.white70),),
            Text("financial system as service", style: TextStyle(fontSize: 16, color: Colors.white30),),
            SizedBox(height: 30.0,),
            new SizedBox(
              width: 20.0, 
              height: 20.0,               
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white54),
                strokeWidth: 2,)
            ),
            new SizedBox(height: 30),
            // Text("token: " + _token ?? ""),
          ],
        )
      ),
    );
  }
}