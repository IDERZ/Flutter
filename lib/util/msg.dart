import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


enum MsgType {
  TOAST, SNACKBAR
}

class MsgUtil {
  
  static void show(String msg, MsgType type, ScaffoldState state) {
    if (type == MsgType.SNACKBAR) {
      _snackbar(msg, state);
    } else if (type == MsgType.TOAST) {
      Fluttertoast.showToast(        
          msg: msg,        
          bgcolor: "#555555",
          textcolor: '#ffffff'
      );
    }
  }

  static void _snackbar(String msg, ScaffoldState state) {
    SnackBar snackbar = new SnackBar(
      content: new Text(msg),
    );

    if (state != null) {
      state.showSnackBar(snackbar);
    }
  }
}
