import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'http_exception.dart';
class Authentication with ChangeNotifier {
  Future<void> signUp(String email, String password) async
  {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyB-YMYPVM7OCmwHblswS0oiJiaKd_1tm4s';

    try{
      final response = await http.post(url, body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }
      ));
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    }catch(error)
    {
      throw error;
    }

  }

  Future<void> logIn(String email, String password) async
  {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyB-YMYPVM7OCmwHblswS0oiJiaKd_1tm4s';

    try {
      final response = await http.post(url, body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }
      ));
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      //print(responseData);
    }
    catch (error) {
      throw error;
    }


  }

}