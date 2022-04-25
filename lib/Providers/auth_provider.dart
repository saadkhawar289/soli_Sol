import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController email2 = TextEditingController();

  bool loading = false;

  Future<Map> login() async {
    loading = true;
    notifyListeners();
    var baseUrl = 'https://bubad.herokuapp.com';
    var url = Uri.parse('$baseUrl/admin/authenticate');
    var response = await http.post(url,
        body: json.encode(
          {
            "username": email.value.text.toString(),
            "password": pass.value.text.toString(),
          },
        ),
        headers: {"content-type": "application/json"});

    final Map<String, dynamic> productData = jsonDecode(response.body);

    if (productData['success']) {
      final prefs = await SharedPreferences.getInstance();
      var tt = await prefs.setString('id', productData['admin']['_id']);
      loading = false;
      notifyListeners();
    } else {
      loading = false;
      notifyListeners();
    }

    return productData;
  }

  Future<bool> Signup() async {
    loading = true;
    notifyListeners();
    try {
      var baseUrl = 'https://bubad.herokuapp.com';
      var url = Uri.parse('$baseUrl/admin/register');
      var response = await http.post(url,
          body: json.encode({
            "firstName": firstName.value.text.toString(),
            "lastName": 'khan',
            "username": userName.value.text.toString(),
            "email": email2.value.text.toString(),
            "phoneNumber": phone.value.text,
            "suburb": "true",
            "password": password.value.text
          }),
          headers: {"content-type": "application/json"});
      final Map<String, dynamic> productData = jsonDecode(response.body);

      loading = false;
      notifyListeners();

      return true;
    } catch (e) {
      loading = false;
      notifyListeners();

      return false;
    }
  }
}
