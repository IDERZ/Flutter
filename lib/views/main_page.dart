import 'package:flutter/material.dart';
import 'package:artlab/views/frags/home_frag.dart';
import 'package:artlab/views/frags/sales_frag.dart';
import 'package:artlab/views/frags/customers_frag.dart';
import 'package:artlab/views/frags/base_frag.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<MainPage> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  int    currentFragIndex = 0;    
  List<BaseFragment> widgets; 
  BaseFragment currentFrag;

  @override
  void initState() {    
    super.initState();

    widgets = [HomeFragment(), SalesFragment(), CustomersFragment()];
    currentFrag = widgets[0];
  }

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      key: _scaffoldKey,            
      body: currentFrag,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentFragIndex,
        onTap: (int index) {
          setState((){
            currentFragIndex = index;            
            currentFrag = widgets[currentFragIndex];
          });          
        },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Эхлэл'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.attach_money),
            title: new Text('Борлуулалт'),            
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.group),
            title: new Text('Харилцагч'),            
          ),
        ],
      ),
    );
  }
}