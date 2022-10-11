import 'package:baowan/alarm.dart';
import 'package:baowan/login.dart';
import 'package:baowan/profile.dart';
import 'package:baowan/services/supabase_service.dart';
import 'package:baowan/setting.dart';
import 'package:flutter/material.dart';
import 'package:baowan/regis.dart';

void main() async {


  SupabaseService.init();
  
  SupabaseService.getFood();
  SupabaseService.addFood();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

