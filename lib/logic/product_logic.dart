import 'dart:async';
import 'dart:convert';
import "package:artlab/util/rest_api.dart";
import 'package:artlab/util/preferences.dart';
import "package:artlab/models/product.dart";
import 'package:flutter/foundation.dart';

class ProductLogic {
  
  static const String QRY_URL = "https://api.artlab.mn/product/qry";

  static Future<List<Product>> list() async {    
    String token = Preferences.getStr('token');
    final response = await RestAPI.get(QRY_URL, headers: {"Authorization": token});
    if (response.success()) {
      return _parseProducts(response.body);
    } 

    return Future.wait(new List());
  }

  static List<Product> _parseProducts(String responseBody) {
    final mapping = json.decode(responseBody).cast<Map<String, dynamic>>();
    return mapping.map<Product>((json) => Product.fromJson(json)).toList(); 
  }     
}