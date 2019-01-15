import "package:flutter/material.dart";
import 'package:artlab/util/validation.dart';
import 'package:artlab/util/preferences.dart';
import 'package:artlab/util/msg.dart';
import 'package:artlab/logic/auth_logic.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key : key);

  @override
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();  

  TextEditingController _unameTextController = TextEditingController();
  
  LoginAuth _loginAuth;
  String _token;

  @override
	void initState() {
		super.initState();
    print("login init...");

    _loginAuth = LoginAuth.instance();
    _fetchRemember();
  }

  @override
  void dispose() {
    _unameTextController.dispose();
    super.dispose();
  }

  void _fetchRemember() {
    setState(() {
      _loginAuth.uname      = Preferences.getStr('uname');
      _loginAuth.isRemember = Preferences.getBln('remember');
      _unameTextController.text = _loginAuth.uname;

      _token = Preferences.getStr('token');
    });
  }

  void _setRemember() {
    if (_loginAuth.isRemember) {
      Preferences.put('uname',    _loginAuth.uname);
      Preferences.put('remember', _loginAuth.isRemember);
    } else {
      Preferences.remove('uname');
      Preferences.remove('remember');
    }  
  }

  void _submit() {        
    _formKey.currentState.save();

    _setRemember();

    _loginAuth.type = 'umm';
    AuthLogic.login(_loginAuth).then((Validation valid){
        if (valid != null && !valid.isEmpty()) {
          MsgUtil.show(valid.allMsg(), MsgType.TOAST, null) ;
        } else {
          Navigator.of(_scaffoldKey.currentContext).pushReplacementNamed('/main');
        }
    });                                      
  }  

  @override
  Widget build(BuildContext context) {
    return new Scaffold (      
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: new Container(                    
        child: new SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24.0, 110.0, 24.0, 24.0),  
          child: new Form(
            key: this._formKey,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text('Artlab', 
                          textAlign: TextAlign.center,
                          style: new TextStyle(fontSize: 30.0, color: Colors.indigo[600], fontFamily: 'Tahoma')),
                new Text('Financial system as service', 
                          textAlign: TextAlign.center,
                          style: new TextStyle(fontSize: 13.0, color: Colors.indigo[600], fontFamily: 'Tahoma', fontStyle: FontStyle.italic)),
                new SizedBox(height: 45.0),
                new TextFormField(
                  decoration: new InputDecoration(labelText: "Username", icon: Icon(Icons.person)),                  
                  onSaved: (value) => _loginAuth.uname = value,                  
                  controller: _unameTextController,
                ),
                new TextFormField(
                  decoration: new InputDecoration(labelText: "Password", icon: Icon(Icons.lock)),
                  obscureText: true,
                  onSaved: (value) => _loginAuth.pword = value,
                ),
                new SizedBox(height: 5.0),
                new Row(
                  children: <Widget>[
                    new Checkbox(
                      activeColor: Colors.grey,
                      value: _loginAuth.isRemember,
                      onChanged: (bool value) { setState(() { _loginAuth.isRemember = value; });  }                        
                    ),
                    new GestureDetector(
                      onTap: () => print("Remember me"),
                      child: new Text(
                        "Remember me",
                        style: new TextStyle(color: Colors.indigo[600],),
                      ),
                    )
                  ],
                ),
                new SizedBox(height: 20.0),
                new RaisedButton(                                
                          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                          color: Color.alphaBlend(Colors.white10, Colors.indigo[600]),
                          child: new Text("Get Started", style: new TextStyle(fontSize: 16.0, color: Colors.white)),                              
                          onPressed: _submit,
                ),
                // new SizedBox(height: 48.0),
                new Container(
                  padding: new EdgeInsets.all(8.0),
                  child:  new Text("Artlab ERP for mobile version. @2019", 
                                    style: new TextStyle(fontSize: 12.0, color: Colors.grey[350]), textAlign: TextAlign.center),                        
                ),
                new Container(
                  padding: new EdgeInsets.all(8.0),
                  child:  new Text("token: " + (_token ?? "")),                        
                ),
              ],
            ),
          )
        )
      ) 
    );
  }
}