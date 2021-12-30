import 'package:dartpy/dartpy.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_signup/mulai.dart';
import 'package:flutter_signup/startdata.dart';
import 'package:flutter_signup/Start.dart';
import 'package:from_css_color/from_css_color.dart';

class Menu extends StatefulWidget {

  @override
  State<Menu> createState() => _MenuState();
}
class _MenuState extends State<Menu> {
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
    children:const <Widget>[
    Text(
    'LifeHealth',
    textAlign: TextAlign.center,
    style:
    TextStyle(fontSize: 22, fontFamily: "Roboto", fontWeight: FontWeight.bold,height: 3.0, color: Colors.brown),
    ),
    ],),
    ),
      Container(
          padding: EdgeInsets.all(35),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                Text(
                  'Pilih Target',
                  style:
                  TextStyle(fontSize: 20, fontFamily: "Roboto", fontWeight: FontWeight.bold,height: 1.0),
                ),
                SizedBox(height: 60),
                Container(
                  padding: EdgeInsets.all(1),
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: <Widget>[
                      FlatButton(
                        onPressed: ()=> Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context){
                              return Start();
                            })),
                        child: Text("Target Durasi "
                            ": 15 Menit",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 2.6,color: Colors.white)),),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.all(1),
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: <Widget>[
                      FlatButton(
                        onPressed: ()=> Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context){
                              return Start();
                            })),
                        child: Text("Target Durasi "
                            ": 30 Menit",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 2.6,color: Colors.white)),),
                    ],
                  ),
                ),
      ],)
      ),])
    ),
    ),
    );
  }
}