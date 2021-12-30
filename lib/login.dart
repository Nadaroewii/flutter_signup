import 'package:flutter/material.dart';
import 'package:flutter_signup/menu.dart';
import 'package:flutter_signup/signup.dart';
import 'package:from_css_color/from_css_color.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isSecure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        width: double.infinity,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Dont Have account ?",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            FlatButton(
                onPressed: ()=> Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context){
                      return SignUp();
                    })),
                child: Text("Sign Up",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))
          ],),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 1,
              color: fromCssColor('#FFDC97'),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/img.png', width: 250, height: 300),
                  SizedBox(height: 5),
                  Text(
                    'LifeHealth',
                    style:
                    TextStyle(fontSize: 22, fontFamily: "Roboto", fontWeight: FontWeight.bold,height: 2.0, color: Colors.brown),
                  ),
                ],),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    style: TextStyle(fontSize: 12, fontFamily: "Roboto", fontWeight: FontWeight.bold,height: 2.0, color: Colors.black),
                    decoration: InputDecoration(
                        hintText: 'ronald_12',
                        border: UnderlineInputBorder(),
                        labelText: 'Username'),
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    obscureText: _isSecure,
                    style: TextStyle(fontSize: 12, fontFamily: "Roboto", fontWeight: FontWeight.bold,height: 2.0, color: Colors.black),
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            if (_isSecure){
                              setState(() {
                                _isSecure = false;
                              });
                            } else {
                              setState(() {
                                _isSecure = true;
                              });
                            }
                          },
                          child: Icon(
                              _isSecure ? Icons.visibility : Icons.visibility_off,
                              color: Colors.black),),
                        hintText: 'Input your password',
                        border: UnderlineInputBorder(),
                        labelText: 'Password'),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 40),
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
                          onPressed: ()=> Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context){
                                return Menu();
                              })),
                          child: Text("Sign In",
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