import 'package:flutter/material.dart';

class MainDrawer extends Drawer {
  final BuildContext context;
  final String accountName;
  final String accountEmail;
  final String accountPhone;
  final GestureTapCallback settingsTapped;
  final GestureTapCallback helpTapped;

  MainDrawer({Key key, this.context, this.accountName, this.accountPhone, this.accountEmail,
              this.settingsTapped, this.helpTapped}) :
    super(key: key,
          child: ListView(
            padding: EdgeInsets.all(1.0),
            children: <Widget>[
              UserAccountsDrawerHeader (                
                accountName: Text(accountName, style: TextStyle(fontSize: 18),),                
                accountEmail: Text(accountPhone + " \n" + accountEmail),
                currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.grey[50],
                  child: Text("Зураг", style: TextStyle(color: Colors.grey[400], fontSize: 11)),
                ),
                decoration: BoxDecoration(
                  color: Colors.indigo[600],                                
                ),
              ),
              ListTile(
                title: Text('Тохиргоо'),
                leading: Icon(Icons.settings),
                onTap: settingsTapped,
              ),
              ListTile(
                title: Text('Тусламж'),
                leading: Icon(Icons.help_outline),
                onTap: helpTapped,
              ),
              Divider(),
              ListTile(
                title: Text('Хаах'),
                leading: Icon(Icons.close),
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
    );
}
