import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../exceptions/signup_exception.dart';
import 'package:provider/provider.dart';

class User with ChangeNotifier {
  String _token=null;
  Future<void> signup(
      {String name,
      String email,
      String phone,
      String pass,
      String passconf}) async {
    const url = 'https://hearts2020.com/eco/api/v1/oauth/register';
    try {
      final respnse = await http.post(url, headers: {
        'Accept': 'application/json'
      }, body: {
        'name': name,
        'email': email,
        'phone': phone,
        'password': pass,
        'password_confirmation': passconf
      });
      final data = json.decode(respnse.body);
      print(data);
      if (data['error'] != null) {
        Map errormap = data['error']['fields'];
        errormap.forEach((fieldname, listoferror) {
          String errormessage = '$fieldname : ${listoferror[0]}';
          throw SignUpException(errormessage);
        });
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> login({String email, String password}) async {
    const url = 'https://hearts2020.com/eco/api/v1/oauth/login';
    try {
      final response = await http.post(url,
          headers: {'Accept': 'application/json'},
          body: {'email': email, 'password': password});
      final data = json.decode(response.body);
      _save(data['token']);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _save(String token) async {
    final sharedprefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    sharedprefs.setString(key, value);
  }

 Future<String>  read() async {
    final sharedprefs = await SharedPreferences.getInstance();
    final key = 'token';
    String value = sharedprefs.get(key);
    return value;
  }
}
