import 'package:dartpy/dartpy.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signup/startdata.dart';
import 'package:flutter_signup/Start.dart';
import 'package:from_css_color/from_css_color.dart';

import 'finishdata.dart';

class Start extends StatefulWidget {

  @override
  State<Start> createState() => _StartState();
}
class _StartState extends State<Start> {
  String selectGender = "";
  List<String> genders = [
    "Female",
    "Male"
  ];

  TextEditingController _ageController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  void tesTapButton(){
  }
  String selectActive = "";
  List<String> active = [
    "Jalan Cepat",
    "Jalan Normal"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  Text(
                    'Personal Data',
                    style:
                    TextStyle(fontSize: 20, fontFamily: "Roboto", fontWeight: FontWeight.bold,height: 1.0),
                  ),
                  SizedBox(height: 20),
                  DropdownSearch<String>(
                    showClearButton: true,
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: active,
                    enabled: true,
                    label: "Activity Type",
                    hint: "Pilih jenis aktivitas",
                    onChanged: (value){
                      setState(() {
                        selectActive = value!;
                      });
                    },
                    dropdownSearchBaseStyle:
                    TextStyle(fontSize: 12,fontFamily: "Roboto",fontWeight: FontWeight.bold,),
                    dropdownSearchDecoration: InputDecoration(
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    style: TextStyle(fontSize: 12, fontFamily: "Roboto", fontWeight: FontWeight.bold,height: 2.0, color: Colors.black),
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Age'),
                    keyboardType: TextInputType.number,
                    controller: _ageController,
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    style: TextStyle(fontSize: 12, fontFamily: "Roboto", fontWeight: FontWeight.bold,height: 2.0, color: Colors.black),
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Weight'),
                    keyboardType: TextInputType.number,
                    controller: _weightController,
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    style: TextStyle(fontSize: 12, fontFamily: "Roboto", fontWeight: FontWeight.bold,height: 2.0, color: Colors.black),
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Height'),
                    keyboardType: TextInputType.number,
                    controller: _heightController,
                  ),
                  SizedBox(height: 10),
                  DropdownSearch<String>(
                    showClearButton: true,
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: genders,
                    label: "Gender",
                    hint: "Pilih Jenis Kelaminmu",
                    onChanged: (value){
                      setState(() {
                        selectGender = value!;
                      });
                    },
                    dropdownSearchBaseStyle:
                    TextStyle(fontSize: 12,fontFamily: "Roboto",fontWeight: FontWeight.bold,),
                    dropdownSearchDecoration: InputDecoration(
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.all(1),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      children: <Widget>[
                        FlatButton(
                          onPressed: () async {
                            Mulai mulai = Mulai(
                              gender: selectGender,
                              dataactv: selectActive,
                              age: _ageController.text,
                              height: _heightController.text,
                              weight: _weightController.text,
                            );
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DataStart(mulai : mulai)));
                          },
                          child: Text("Start",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],),
        ),
      ),
    );
  }
}
