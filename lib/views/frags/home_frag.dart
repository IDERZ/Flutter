import "package:flutter/material.dart";
import 'package:artlab/logic/auth_logic.dart';
import 'package:artlab/views/frags/base_frag.dart';
import 'package:artlab/views/comps/main_top_bar.dart';
import 'package:artlab/views/comps/main_drawer.dart';

class HomeFragment extends StatefulWidget implements BaseFragment {  
  HomeFragmentState createState() => HomeFragmentState();
}

class HomeFragmentState extends State<HomeFragment>  {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _logout() {
    AuthLogic.logout();
    Navigator.of(_scaffoldKey.currentContext).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      key: _scaffoldKey,
      drawer: MainDrawer(
        context: context,        
        accountName: "З.Идэр",
        accountPhone: "99015905",
        accountEmail: "ider.zorigoo@gmail.com",
        settingsTapped: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed("/settings");
        },
        helpTapped: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed("/help");
        },
      ),
      appBar: MainTopBar( 
        context: context,
        title: Text("Artlab ERP", style: TextStyle(fontSize: 18),),
        logoutPressed: _logout,
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasError) print('error: ' + snapshot.error.toString());
            return snapshot.hasData
                ? Center(child: Text("Home fragments..."))
                : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}