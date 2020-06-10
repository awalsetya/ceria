import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:ceria/services/service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider with ChangeNotifier {
  bool isLoading = false;

  Future<void> login(noTelp, password) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Map data = {'phone': noTelp, 'password': password};
    var jsonRespon;

    final response = await http.post(NetworkURL.login(), body: data);
    if (response.statusCode == 200) {
      jsonRespon = json.decode(response.body);
      if (jsonRespon != null) {
        isLoading = false;
        pref.setString("token", jsonRespon['token']);
      } else {
        isLoading = false;
      }
      print(response.body);
    }
    notifyListeners();
  }
}
