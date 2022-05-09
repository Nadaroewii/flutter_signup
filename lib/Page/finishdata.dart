import 'dart:core';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signup/models/encrypt_response_model.dart';
import 'package:flutter_signup/models/login_response_model.dart';
import 'package:flutter_signup/models/register_response_model.dart';
import 'package:flutter_signup/services/shared_services.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:location/location.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:flutter_signup/models/login_response_model.dart';
import 'package:flutter_signup/models/Entry.dart';
import 'package:flutter_signup/models/Start.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:flutter_signup/services/api_services.dart';

import '../config.dart';
import 'package:flutter_signup/encryption/encrypt.dart';


class DataFinish extends StatefulWidget {
  final Entry entry;
  final Mulai mulai;

  const DataFinish({
    Key? key, required this.entry, required this.mulai}
      ) : super(key: key);
  @override
  State<DataFinish> createState() => _DataFinishState(entry: entry, mulai: mulai);
}

class _DataFinishState extends State<DataFinish> {
  late Entry entry;
  late Mulai mulai;
  bool isAPIcallProcess = false;
  _DataFinishState({required this.entry, required this.mulai}) : super();

  APIService apiservice = APIService();

  //var loginDetails = SharedService.loginDetails();

  //Hitung kalori
  _kalori (weight, duration, dist){
    double kec = (dist/1000)/(duration/60);
    double kal;
    var berat = int.parse(weight);
    if (kec < 3.2) {
      kal = (2 * 7.7 * (berat * 2.2) / 200) * duration;
    } else if (3.2 < kec || kec <= 4.7)
    {
      kal = (2.5 * 7.7 * (berat * 2.2) / 200) * duration;
    } else if (4.8 <= kec || kec <= 5.5) {
      kal = (3.3 * 7.7 * (berat * 2.2)/200)* duration;
    } else if (5.6 <= kec || kec <= 6.4) {
      kal = (3.8 * 7.7 * (berat * 2.2)/200)* duration;
    } else if (kec == 0 || dist == 0) {
      kal = 0;
    } else {
      kal = (5 * 7.7 * (berat * 2.2)/200)* duration;
    }
    return kal.toStringAsFixed(2);
  }

  //konversi ke ascii
    getCharASCII(pesan) {
    List <int> listChar = [];
    for (var i = 0; i < pesan.length; i++)
    {
      var chr = pesan[i];
      var inn = chr.codeUnitAt(0);
      listChar.add(inn);
    }
    return listChar;
    }

    //konversi ke rannum
    getBilanganAcak(pesan, p, y) {
    List <int> listNumber = [];
    var pp = p.toInt() - 2;
    var rand;
    for (var i = 0; i < pesan.length; i++) {
        do{
          var random = new Random();
          var nilairandom = random.nextDouble();
          rand = (pp * nilairandom).toInt();
        } while (pow(y,rand) <= 0);
        listNumber.add(rand);
    }
    return listNumber;
  }

  //enkripsi func
  getEnkripsi(chrASCII, rnd, g, p, y, pesan) {
    var gamma;
    var delta;
    for (var i = 0; i < pesan.length; i++) {
      var m = int.parse(chrASCII);
      var k = int.parse(rnd);
      gamma = g.modPow(k, p);
      var haspow = pow(y, k);
      delta = (haspow*m)%(p);
      print(k);
      print(haspow);
      print(delta);
    }
    return gamma.toString() + " " + delta.toString() + " ";
  }
  var p = 2903;
  var g = 6;
  var y = 1938;
  //LoginResponseModel? loginDetails = await SharedService.loginDetails();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            child: Form(
                child: _finishdataUI(context)
            ),
          )
      ),);
  }
  Widget _finishdataUI(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.1,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 1,
                color: fromCssColor('#FFDC97'),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'LifeHealth',
                      style:
                      TextStyle(fontSize: 24,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                          height: 3.0,
                          color: Colors.brown),
                    ),
                  ],),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Result Data',
                      style:
                      TextStyle(fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                          height: 1.0),
                    ),
                    SizedBox(height: 10),
                  ],),),
              Container(
                margin: EdgeInsets.only(left: 30),
                alignment: AlignmentDirectional.topStart,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          'Date :',
                          style:
                          TextStyle(fontSize: 18,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              height: 1.0),
                        ),
                        Text(' ' +
                            entry.date,
                          style:
                          TextStyle(
                              fontSize: 18, fontFamily: "Roboto", height: 1.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Text(
                          'Duration :',
                          style:
                          TextStyle(fontSize: 18,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              height: 1.0),
                        ),
                        Text(' ' +
                            entry.duration,
                          style:
                          TextStyle(
                              fontSize: 18, fontFamily: "Roboto", height: 1.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Text(
                          'Distance :',
                          style:
                          TextStyle(fontSize: 18,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              height: 1.0),
                        ),
                        Text(' ' +
                            entry.distance.toStringAsFixed(2) + ' meter',
                          style:
                          TextStyle(
                              fontSize: 18, fontFamily: "Roboto", height: 1.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Text(
                          'Activity Type :',
                          style:
                          TextStyle(fontSize: 18,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              height: 1.0),
                        ),
                        Text(' ' +
                            mulai.dataactv,
                          style:
                          TextStyle(
                              fontSize: 18, fontFamily: "Roboto", height: 1.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Text(
                          'Calories Burned :',
                          style:
                          TextStyle(fontSize: 18,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              height: 1.0),
                        ),
                        Text(' ' +
                            _kalori(mulai.weight, entry.waktutot, entry
                                .distance) + ' kal',
                          style:
                          TextStyle(
                              fontSize: 18, fontFamily: "Roboto", height: 1.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Text(
                          'Coordinates now :',
                          style:
                          TextStyle(fontSize: 18,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              height: 1.0),
                        ),
                        Text(' (' +
                            entry.lastlongitude.toStringAsFixed(4) + ' , ' +
                            entry.lastlatitude.toStringAsFixed(4) + ' )',
                          style:
                          TextStyle(
                              fontSize: 18, fontFamily: "Roboto", height: 1.0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Center(
                        child: FormHelper.submitButton(
                            "Finish",
                                () async {
                              //Mengambil serverpubkey
                                  LoginResponseModel? loginDetails = await SharedService.loginDetails();
                              //deklarasi var
                                  var duration = entry.duration;
                                  var distance = entry.distance.toStringAsFixed(2);
                                  var dataakt = mulai.dataactv;
                                  var kalori = _kalori(mulai.weight, entry.waktutot, entry.distance);
                                  var lastlatitude = entry.lastlatitude.toStringAsFixed(4);
                                  var lastlongitude = entry.lastlongitude.toStringAsFixed(4);

                                  var pnew = int.parse(loginDetails!.data.ServerpubKey[0]);
                                  var gnew = int.parse(loginDetails!.data.ServerpubKey[1]);
                                  var ynew = int.parse(loginDetails!.data.ServerpubKey[2]);
                                  
                                  print("Nilai p = " + pnew.toString());
                                  print("Nilai g = " + gnew.toString());
                                  print(ynew);

                              //konversi var ke ascii
                                  var durchr = getCharASCII(duration);
                                  var dischr = getCharASCII(distance);
                                  var datchr = getCharASCII(dataakt);
                                  var kalchr = getCharASCII(kalori);
                                  var latchr = getCharASCII(lastlatitude);
                                  var longchr = getCharASCII(lastlongitude);
                             //konversi var ke random num
                                  var durran = getBilanganAcak(duration, pnew, ynew);
                                  var disran = getBilanganAcak(distance, pnew, ynew);
                                  var datran = getBilanganAcak(dataakt, pnew, ynew);
                                  var kalran = getBilanganAcak(kalori, pnew, ynew);
                                  var latran = getBilanganAcak(lastlatitude, pnew, ynew);
                                  var longran = getBilanganAcak(lastlongitude, pnew, ynew);

                                   print(durchr);
                                   print(durran);

                             //proses enkripsi
                                  var durchiper = "";
                                  var durEnkrip = "";
                                  var dischiper = "";
                                  var disEnkrip = "";
                                  var datchiper = "";
                                  var datEnkrip = "";
                                  var kalchiper = "";
                                  var kalEnkrip = "";
                                  var latchiper = "";
                                  var latEnkrip = "";
                                  var lonchiper = "";
                                  var lonEnkrip = "";

                                  for (var i = 0; i < duration.length; i++) {
                                     durchiper = getEnkripsi(durchr[i].toString(), durran[i].toString(), gnew,
                                        pnew, ynew, duration);
                                     durEnkrip += durchiper;
                                  }
                                  print(durEnkrip);
                                  for (var i = 0; i < distance.length; i++) {
                                    dischiper = getEnkripsi(dischr[i].toString(), disran[i].toString(), gnew,
                                        pnew, ynew, distance);
                                    disEnkrip += dischiper;
                                  }
                                  for (var i = 0; i < dataakt.length; i++) {
                                    datchiper = getEnkripsi(datchr[i].toString(), datran[i].toString(), gnew,
                                        pnew, ynew, dataakt);
                                    datEnkrip += datchiper;
                                  }
                                  for (var i = 0; i < kalori.length; i++) {
                                    kalchiper = getEnkripsi(kalchr[i].toString(), kalran[i].toString(), gnew,
                                        pnew, ynew, kalori);
                                    kalEnkrip += kalchiper;
                                  }
                                  for (var i = 0; i < lastlatitude.length; i++) {
                                    latchiper = getEnkripsi(latchr[i].toString(), latran[i].toString(), gnew,
                                        pnew, ynew, lastlatitude);
                                    latEnkrip += latchiper;
                                  }
                                  for (var i = 0; i < lastlongitude.length; i++) {
                                    lonchiper = getEnkripsi(longchr[i].toString(), longran[i].toString(), gnew,
                                        pnew, ynew, lastlongitude);
                                    lonEnkrip += lonchiper;
                                  }

                              //convert to base64
                                  var dur64 = base64.encode(utf8.encode(durEnkrip));
                                  var dis64 = base64.encode(utf8.encode(disEnkrip));
                                  var dat64 = base64.encode(utf8.encode(datEnkrip));
                                  var kal64 = base64.encode(utf8.encode(kalEnkrip));
                                  var lat64 = base64.encode(utf8.encode(latEnkrip));
                                  var lon64 = base64.encode(utf8.encode(lonEnkrip));

                              bool responsedata = await apiservice.getEncrypt(dur64.toString(),
                                  dis64.toString(), dat64.toString(), kal64.toString(),
                                  lat64.toString(), lon64.toString());

                              if(responsedata){
                                FormHelper.showSimpleAlertDialog(
                                  context,
                                  Config.appName,
                                  "Data berhasil dikirim ke server, Anda dapat 10 Poin",
                                  "OK",
                                      () {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        '/startdata',
                                            (route) => false);
                                  },
                                );
                              }
                                  // if (validateAndSave()) {
                                  //   setState(() {
                                  //     isAPIcallProcess = true;
                                  //   });
                                  //
                                  //   EncryptRequest dataencrypt = EncryptRequest(
                                  //     duration : entry.duration,
                                  //     distance : entry.distance,
                                  //     dataactv: mulai.dataactv,
                                  //     kal: _kalori(mulai.weight, entry.waktutot, entry.distance),
                                  //     lastlatitude: entry.lastlatitude,
                                  //     lastlongitude: entry.lastlongitude
                                  //   );
                                  //
                                  //   APIService.getEncrypt(dataencrypt).then((responsedata) => {
                                  //     setState(() {
                                  //       isAPIcallProcess = false;
                                  //     }),
                                  //     if(responsedata.data != null) {
                                  //       FormHelper.showSimpleAlertDialog(
                                  //         context,
                                  //         Config.appName,
                                  //         "Data Berhasil Di Kirim",
                                  //         "OK",
                                  //             () {
                                  //           Navigator.pushNamedAndRemoveUntil(
                                  //               context,
                                  //               '/login',
                                  //                   (route) => true);
                                  //         },
                                  //       )
                                  //     }
                                  //     else {
                                  //       FormHelper.showSimpleAlertDialog(
                                  //         context,
                                  //         Config.appName,
                                  //         "Data Gagal Di Kirim",
                                  //         "OK",
                                  //             () {
                                  //           Navigator.pop(context);
                                  //         },
                                  //       )
                                  //     }
                                  //   });
                                  // }
                            },
                            btnColor: Colors.brown,
                            borderColor: Colors.white,
                            txtColor: Colors.white,
                            borderRadius: 10)
                    ),
                    SizedBox(height: 30),
                    Center(
                        child: FormHelper.submitButton(
                            "Log Out",
                                () {
                              SharedService.logout(context);
                            },
                            btnColor: Colors.brown,
                            borderColor: Colors.white,
                            txtColor: Colors.white,
                            borderRadius: 10)
                    ),
                  ],),),
            ],),
          ),)
    );
  }
}