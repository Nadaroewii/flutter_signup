import 'dart:convert';
import 'package:flutter_signup/config.dart';
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

    if(response.statusCode == 200) {
      //SHARED
      await SharedService.setLoginDetails(loginResponseJson(response.body));
      return true;
    } else {
      return false;
    }
  }
  static Future<RegisterResponseModel>
  register(RegisterRequestModel model)
  async {
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
      'Authorization' : 'Basic ${loginDetails!.data.token}'
    };
    var url = Uri.http(Config.apiURL, Config.userProfileAPI);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if(response.statusCode == 200) {
      //SHARED
      return response.body;
    } else {
      return "";
    }
  }
}