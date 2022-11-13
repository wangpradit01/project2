import 'package:baowan/Provider/FoodProvider.dart';
import 'package:baowan/login.dart';
import 'package:baowan/services/supabase_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FoodProvider>(
            create: (context) => FoodProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Prompt',
        ),
        home: LoginPage(),
      ),
    );
  }
}
