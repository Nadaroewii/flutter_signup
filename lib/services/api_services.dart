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


  static Future<bool> login(Map model) async {
    print(model);
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    var url = Uri.parse(Config.apiURL + Config.loginAPI);

    var response = await client.post(
      url,
      //Uri.parse(Config.apiURL + Config.loginAPI),
      headers: requestHeaders,
      body: model,
    );

    if (response.statusCode == 200) {
      //SHARED
      await SharedService.setLoginDetails(loginResponseJson(response.body));
      return true;
    } else {
      return false;
    }
  }

  static Future<RegisterResponseModel> register(
      Map model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    var url = Uri.parse(Config.apiURL + Config.registerAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: model,
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

  Future getEncrypt(List<String> duration, List<String> distance, List<String> dataactv, List<String> kal,
      List<String> lastlatitude, List<String> lastlongitude ) async {
    try {
      var loginDetails = await SharedService.loginDetails();
      final responsedata = await http.post(
        Uri.parse(Config.apiURL + Config.dataencryptAPI),
        headers: {
          'Authorization': 'Bearer ${loginDetails!.data.token}',
        },
        body: {
          'duration': json.encode(duration),
          'distance': json.encode(distance),
          'dataactv':json.encode(dataactv),
          'kal': json.encode(kal),
          'lastlatitude': json.encode(lastlatitude),
          'lastlongitude': json.encode(lastlongitude)
        }
      );

      if (responsedata.statusCode == 200) {
        //var new encrypted = Encrypt.fromJson(jsonDecode(responsedata.body));
        return true;
      } else
        return false;
    } catch (e) {
      print(e);
    }
  }
}