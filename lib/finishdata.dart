import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:location/location.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:flutter_signup/Entry.dart';
import 'package:flutter_signup/Start.dart';


class DataFinish extends StatefulWidget {
  final Entry entry;
  final Mulai mulai;

  DataFinish({Key? key, required this.entry, required this.mulai}) : super(key: key);
  @override
  State<DataFinish> createState() => _DataFinishState(entry: entry, mulai: mulai);
}

class _DataFinishState extends State<DataFinish> {
  late Entry entry;
  late Mulai mulai;
  _DataFinishState({required this.entry, required this.mulai}) : super();

  _kalori (kec, weight, duration){
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
    } else if (kec == 0) {
      kal = 0;
    } else {
      kal = (5 * 7.7 * (berat * 2.2)/200)* duration;
    }
    return kal.toStringAsFixed(2);
  }
  @override
  Widget build(BuildContext context) => Scaffold(
  bottomSheet: Container(
  width: double.infinity,
  color: Colors.brown,
  height: 50,
  child: Row(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  ),
  ),
  body: Container(
  width: MediaQuery.of(context).size.width,
  height: MediaQuery.of(context).size.height,
  child: SingleChildScrollView(
  child: Column(children: [
  Container(
  height: MediaQuery.of(context).size.height * 0.1,
  width: MediaQuery.of(context).size.width * 1,
  color: fromCssColor('#FFDC97'),
  child: Row(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children:<Widget>[
  Text(
  'LifeHealth',
  textAlign: TextAlign.center,
  style:
  TextStyle(fontSize: 22, fontFamily: "Roboto", fontWeight: FontWeight.bold,height: 3.0, color: Colors.brown),
  ),
  ],),
  ),
  Container(
  padding: EdgeInsets.all(20),
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.center,
  children:<Widget>[
  Text(
  'Hasil Data',
  style:
  TextStyle(fontSize: 20, fontFamily: "Roboto", fontWeight: FontWeight.bold,height: 1.0),
  ),
  SizedBox(height: 10),
  ],),),
    Container(
      margin: EdgeInsets.only(left: 30),
      alignment: AlignmentDirectional.topStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children:<Widget>[
          Row(
            children:[
              Text(
                'Tanggal :',
                style:
                TextStyle(fontSize: 18, fontFamily: "Roboto", fontWeight: FontWeight.bold,height: 1.0),
              ),
              Text(' ' +
                entry.date,
                style:
                TextStyle(fontSize: 18, fontFamily: "Roboto",height: 1.0),
              ),
            ],
          ),
          SizedBox(height: 30),
    Row(
      children:[
        Text(
          'Durasi :',
          style:
          TextStyle(fontSize: 18, fontFamily: "Roboto", fontWeight: FontWeight.bold,height: 1.0),
        ),
        Text(' ' +
            entry.duration,
          style:
          TextStyle(fontSize: 18, fontFamily: "Roboto",height: 1.0),
        ),
      ],
    ),
          SizedBox(height: 30),
          Row(
            children:[
          Text(
                'Jarak :',
                style:
                TextStyle(fontSize: 18, fontFamily: "Roboto", fontWeight: FontWeight.bold,height: 1.0),
              ),
              Text(' ' +
                  entry.distance.toStringAsFixed(2) + ' meter',
                style:
                TextStyle(fontSize: 18, fontFamily: "Roboto",height: 1.0),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children:[
              Text(
                'Jenis Aktivitas :',
                style:
                TextStyle(fontSize: 18, fontFamily: "Roboto", fontWeight: FontWeight.bold,height: 1.0),
              ),
              Text(' ' +
                  mulai.dataactv,
                style:
                TextStyle(fontSize: 18, fontFamily: "Roboto",height: 1.0),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children:[
              Text(
                'Jumlah Kalori :',
                style:
                TextStyle(fontSize: 18, fontFamily: "Roboto", fontWeight: FontWeight.bold,height: 1.0),
              ),
              Text(' ' +
                  _kalori(entry.speed, mulai.weight, entry.waktutot) + ' kal',
                style:
                TextStyle(fontSize: 18, fontFamily: "Roboto",height: 1.0),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children:[
              Text(
                'Koordinat sekarang :',
                style:
                TextStyle(fontSize: 18, fontFamily: "Roboto", fontWeight: FontWeight.bold,height: 1.0),
              ),
              Text(' (' +
                  entry.lastlongitude.toStringAsFixed(4) + ' , ' + entry.lastlatitude.toStringAsFixed(4) + ' )',
                style:
                TextStyle(fontSize: 18, fontFamily: "Roboto",height: 1.0),
              ),
            ],
          ),
        ],),),],),
  ),)
  );


}