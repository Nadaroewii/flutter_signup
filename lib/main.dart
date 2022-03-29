import 'package:flutter/material.dart';
import 'package:flutter_signup/Page/login.dart';
import 'package:flutter_signup/Page/mulai.dart';
import 'package:flutter_signup/services/shared_services.dart';
import 'package:flutter_signup/Page/signup.dart';

Widget _defaultHome = const LoginPage();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool _result = await SharedService.isLoggedIn();
  if(_result) {
    _defaultHome = const Start();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => _defaultHome,
        '/login': (context) => const LoginPage(),
        '/startdata': (context) => const Start(),
        '/register': (context) => const SignUp()
      },
    );
  }
}





