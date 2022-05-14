import 'dart:convert';
import 'package:flutter_signup/config.dart';
import 'package:flutter_signup/models/ecnrypt_request_model.dart';
import 'package:flutter_signup/models/encrypt_response_model.dart';
import 'package:flutter_signup/models/login_request_model.dart';
import 'package:flutter_signup/models/login_response_model.dart';
import 'package:flutter_signup/models/register_request_model.dart';
import 'package:flutter_signup/models/register_response_model.dart';
import 'package:flutter_signup/services/shared_services.dart';
import 'package:http/http.dart' as http;

class  APIService {
  static var client = http.Client();


  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, Config.loginAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      //SHARED
      await SharedService.setLoginDetails(loginResponseJson(response.body));
      return true;
    } else {
      return false;
    }
  }

  static Future<RegisterResponseModel>
  register(RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, Config.registerAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    return registerResponseModel(response.body);
  }

  static Future<String> getUserProfile() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${loginDetails!.data.token}'
    };
    var url = Uri.http(Config.apiURL, Config.userProfileAPI);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      //SHARED
      return response.body;
    } else {
      return "";
    }
  }

  Future getEncrypt(String duration, String distance, String dataactv, String kal,
      String lastlatitude, String lastlongitude ) async {
    try {
      var loginDetails = await SharedService.loginDetails();
      final responsedata = await http.post(
        Uri.parse('http://192.168.1.7:4000/users/dataencrypt'),
        headers:  <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Basic ${loginDetails!.data.token}',
        },
        body: jsonEncode(<String, String>{
          'duration': duration,
          'distance': distance,
          'dataactv':dataactv,
          'kal': kal,
          'lastlatitude': lastlatitude,
          'lastlongitude': lastlongitude
        }),
      );

      var data = responsedata.body;
      print(data);

      if (responsedata.statusCode == 201) {
        // If the server did return a 201 CREATED response,
        // then parse the JSON.
        return Encrypt.fromJson(jsonDecode(responsedata.body));
      } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        throw Exception('Failed to send data.');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}