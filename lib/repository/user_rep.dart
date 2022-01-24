import 'dart:convert';
import 'dart:convert';
import 'dart:convert';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/model/user.dart';
import 'package:meta/meta.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;


class UserRep {

  final storage = const FlutterSecureStorage();

  Future<String?> get jwtToken async{
    return await storage.read(key: 'jwt');
  }

  final String URL = 'tamagotchi-backend.herokuapp.com';

  Future<User?> get user async{
    if (await jwtToken == null){
      return null;
    }

    int id = JwtDecoder.decode((await jwtToken)!)['id'];
    var url = Uri.https(URL, '/user/$id');
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: 'application/json'
    });
    if (response.statusCode == 200) {
      User user = User.fromJson(json: json.decode(response.body));
      return user;
    } else {
      return null;
    }

  }

  Future<String?> logIn({
    required String login,
    required String password,
  }) async{
    var auth = {};
    auth['name'] = login;
    auth['password'] = password;
    try {
      var url = Uri.https(URL, '/user/login');
      var response = await http.post(url,
          headers: {
            HttpHeaders.acceptHeader: "application/json",
            HttpHeaders.contentTypeHeader: 'application/json'
          },
          body: json.encode({"name": login, "password": password}));
      if (response.statusCode == 200) {
        String data = json.decode(response.body)['access_token'];
        await storage.write(key: 'jwt', value: data);
        return data;
      } else {
        return null;
      }
    } catch (error) {
    print(error.toString());
    return null;
    }
}

  void logOut(){
    storage.delete(key: 'jwt');
}

  Future<bool> registration({
    required String login,
    required String password
  }) async{
    var url = Uri.https(URL, '/user/registration');
    var response = await http.post(url,
        headers:{
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: jsonEncode({
          "password": password,
          "name": login})
    );
    return response.statusCode >= 200 && response.statusCode < 300;
  }

}