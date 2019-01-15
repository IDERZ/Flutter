import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RestAPI {  

  static const int NO_INTERNET = -1;  

  static RestAPI _instance = new RestAPI.internal();
  RestAPI.internal();
  factory RestAPI() => _instance;

  static Future<ALResponse> get(String url, {Map<String, String> headers}) async {
    return await http.get(url, headers: headers).then((http.Response res) {            
      final int statusCode = res.statusCode;
      print("rest get status:" + statusCode.toString());      
      if (statusCode < 200 || statusCode > 400 || json == null) {
        return new ALResponse(statusCode, '', '');
      }

      String utf8Body = utf8.decode(res.bodyBytes);
      return new ALResponse(statusCode, utf8Body, res.headers['authorization']);
    }).catchError((error) {
      return new ALResponse(RestAPI.NO_INTERNET, '', '');
    });
  }

  static Future<ALResponse> post(String url, {Map headers, body, encoding}) async {            
    return await http.post(url, body: json.encode(body), 
                                headers: headers, 
                                encoding: encoding)
      .then((http.Response res) {        
        final int statusCode = res.statusCode;
        if (statusCode < 200 || statusCode > 400 || json == null) {
          return new ALResponse(statusCode, '', '');
        }
        String utf8Body = utf8.decode(res.bodyBytes);
        return new ALResponse(statusCode, utf8Body, res.headers['authorization']);
      }).catchError((error){
        return new ALResponse(RestAPI.NO_INTERNET, '', '');
      });
  }  
}

class ALResponse {    
    ALResponse(this.statusCode, this.body, this.token);
    
    final int statusCode;
    final String body;
    final String token;
    
    bool success() {
      return statusCode >= 200 && statusCode < 300;
    }
}