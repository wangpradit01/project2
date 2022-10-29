import 'dart:js';

import 'package:baowan/login.dart';
import 'package:baowan/regis.dart';


class AppRoutes {
  static const LoginRoute = "/login";
  static const SignupRoute = "/signup";


  static final routes = {
    LoginRoute: (context) => LoginPage(),
    SignupRoute: (context) => Regis()
    };
}