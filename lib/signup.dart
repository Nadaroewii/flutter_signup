import 'package:flutter/material.dart';
import 'package:flutter_signup/login.dart';
import 'package:flutter_signup/mulai.dart';
import 'package:from_css_color/from_css_color.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  void tesTapButton(){
  }
  bool _isSecure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        width: double.infinity,
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Have account ?",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            FlatButton(
                onPressed: ()=> Navigator.push(context,
                    MaterialPageRoute(builder: (context){
                      return LoginPage();
                    })),
                child: Text("Sign In",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))
          ],),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 1,
              color: fromCssColor('#FFDC97'),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'LifeHealth',
                    style:
                    TextStyle(fontSize: 24, fontFamily: "Roboto", fontWeight: FontWeight.bold,height: 3.0, color: Colors.brown),
                  ),
                ],),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign Up Account',
                    style:
                    TextStyle(fontSize: 20, fontFamily: "Roboto", fontWeight: FontWeight.bold,height: 1.0),
                  ),
                  TextFormField(
                    style: TextStyle(fontSize: 12, fontFamily: "Roboto", fontWeight: FontWeight.bold,height: 2.0, color: Colors.black),
                    decoration: InputDecoration(
                        hintText: 'Jody Abrham',
                        border: UnderlineInputBorder(),
                        labelText: 'Name'),
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    style: TextStyle(fontSize: 12, fontFamily: "Roboto", fontWeight: FontWeight.bold,height: 2.0, color: Colors.black),
                    decoration: InputDecoration(
                        hintText: 'Jody_123',
                        border: UnderlineInputBorder(),
                        labelText: 'Username'),
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    style: TextStyle(fontSize: 12, fontFamily: "Roboto", fontWeight: FontWeight.bold,height: 2.0, color: Colors.black),
                    decoration: InputDecoration(
                        hintText: 'abcd@x.com',
                        border: UnderlineInputBorder(),
                        labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
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
                        hintText: 'Confirm your password',
                        border: UnderlineInputBorder(),
                        labelText: 'Confirm Password'),
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
                                return Start();
                              })),
                          child: Text("Sign Up",
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