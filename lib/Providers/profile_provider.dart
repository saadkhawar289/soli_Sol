import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';

import '../Model/User.dart';

class ProfileProvider extends ChangeNotifier {
User user =User(
    password: '',
    email: '',
    first_name: '',
    mobile_num: '',
    user_name: '');

String nm ='';

  bool loading = false;


  Future<bool> fetchProfileData() async {

    loading=true;

    final prefs = await SharedPreferences.getInstance();
    final String? id = prefs.getString('id');


    try {
      var baseUrl = 'https://bubad.herokuapp.com';
      var url = Uri.parse('$baseUrl/admin$id');
      var response = await http.get(url,

          headers: {"content-type": "application/json"});
      final Map<String, dynamic> productData = jsonDecode(response.body);
user=User(
  email:productData['data']['email'],
  first_name: productData['data']['firstName'],
  mobile_num: productData['data']['phoneNumber'],
  password: productData['data']['password'],
  user_name: productData['data']['username']

);
      loading = false;
      notifyListeners();

      return true;
    } catch (e) {
      loading=false;


      notifyListeners();
      print('error');
      print(e);

      return false;
    }
  }
}
