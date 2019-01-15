import "package:artlab/util/rest_api.dart";
import 'package:artlab/util/validation.dart';
import 'package:artlab/util/preferences.dart';

class AuthLogic {
  static const String AUTH_LOGIN_REST = 'https://api.artlab.mn/auth/login';
  static const String AUTH_CHECK_REST = 'https://api.artlab.mn/auth/check';

  static AuthLogic instance() {
    return new AuthLogic();
  }

  static Future<Validation> login(LoginAuth loginAuth) {
    Validation val = new Validation();    

    return RestAPI.post(AUTH_LOGIN_REST, body: loginAuth.toMap()).then((ALResponse response){            
      if (response.success()) {        
        Preferences.put('token', response.token);
      } else {        
        if (response.statusCode == -1) {
          val.addMsg('Интернэт холболтоо шалгана уу!');
        } else if (response.statusCode == 401) {
          val.addMsg('Нэвтрэх нэр эсвэл нууц үг буруу байна!');
        } else {
          val.addMsg(response.statusCode.toString() + ': алдаа гарсан байна!');
        }
      }

      return val; 
    }).catchError((onError){       
       return val.addMsg('error: $onError');    
    });    
  }

  static Future<bool> check() {            
    String token = Preferences.getStr('token');
    return RestAPI.get('https://api.artlab.mn/auth/check', 
                        headers: {"Authorization" : token}).then((ALResponse response){
                            return response.success(); 
                        });
       
  }

  static Future<bool> check1(String token) { 
    return RestAPI.get(AUTH_CHECK_REST, 
                        headers: {"Authorization" : token}).then((ALResponse response){
                            return response.success(); 
                        });
       
  }

  static void logout() {
    Preferences.remove('token');
  }
}

class LoginAuth {
  String uname;
  String pword;
  String type;
  bool   isRemember = false;

  static LoginAuth instance() {
    return new LoginAuth();
  }

  Map<String, String> toMap() => {     
    'username': uname,
    'password': pword,
    'type'    : type,
  };
}