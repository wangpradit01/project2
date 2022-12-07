import 'package:baowan/HomePage.dart';
import 'package:baowan/Provider/FoodProvider.dart';
import 'package:baowan/Provider/HistoryProvider.dart';
import 'package:baowan/login.dart';
import 'package:baowan/services/supabase_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://tsipaksrpfnlqivbhzmn.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRzaXBha3NycGZubHFpdmJoem1uIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzAxNTg3NjksImV4cCI6MTk4NTczNDc2OX0.XdyOttthXWZQA4zXYm4uDTIQ-EeZpF9Vg3xKb-SNa5M',
  );
  await SupabaseService.init();
  await SupabaseService.getFood();
  await SupabaseService.getCarb();

  final SharedPreferences access = await SharedPreferences.getInstance();
  bool? isLogin = access.getBool('isLogin');
  if (isLogin == true) {
    String? email = access.getString('email');
    String? password = access.getString('password');
    await SupabaseService.login(email!, password!);
  }
  // SupabaseService.addFood();
  runApp(MyApp(
    isLogin: isLogin,
  ));
}

class MyApp extends StatefulWidget {
  final bool? isLogin;
  const MyApp({
    Key? key,
    this.isLogin,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FoodProvider>(
            create: (context) => FoodProvider()),
        ChangeNotifierProvider<HistoryProvider>(
            create: (context) => HistoryProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Prompt',
        ),
        home: widget.isLogin == true ? HomePage() : LoginPage(),
      ),
    );
  }
}
