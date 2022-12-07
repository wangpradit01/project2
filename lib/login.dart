import 'package:baowan/ForgotPassword.dart';
import 'package:baowan/HomePage.dart';
import 'package:baowan/regis.dart';
import 'package:baowan/services/supabase_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(
        shrinkWrap: false,
        children: [
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 50),
            padding: EdgeInsets.only(left: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      children: List.generate(
                        1,
                        (index) =>
                            SvgPicture.asset("assets/icons/LOGO BAOWAN.svg"),
                      ),
                    ),
                    SizedBox(
                      width: 13.23,
                    ), //ตัวเว้นระยะห่าง
                    Text(
                      "BAOWAN",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            letterSpacing: .45,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: SvgPicture.asset(
              "assets/icons/Artwork.svg",
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 30),
            //left,right เป็นตำแน่งความข้างจากด้านซ้ายตัวแรก,ความข้างจากด้านขวาของอันหลัง
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //ระหว่างตัวแรกและตัวที่2 ของ header
              children: [
                Column(
                  children: [
                    Text(
                      "ลงชื่อเข้าใช้",
                      style: GoogleFonts.prompt(
                        textStyle: const TextStyle(
                            letterSpacing: .45,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "ยินดีต้อนรับสู่ แอปพลิเคชันโภชนาการสำหรับผู้ป่วยเบาหวาน",
                      style: GoogleFonts.prompt(
                        color: Colors.grey[600],
                        textStyle: const TextStyle(
                          letterSpacing: .30,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),

            //email
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: TextField(
                          controller: email,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Email"),
                          style: GoogleFonts.prompt(
                            textStyle: const TextStyle(
                                letterSpacing: .39,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),

            //passsword
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: TextField(
                          controller: password,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Password"),
                          style: GoogleFonts.prompt(
                            textStyle: const TextStyle(
                                letterSpacing: .39,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),

          SizedBox(
            height: 30,
          ),

          //login button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextButton(
                child: Text(
                  "เข้าสู่ระบบ",
                  style: GoogleFonts.prompt(
                    textStyle: TextStyle(
                        letterSpacing: .39,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                onPressed: () async {
                  bool? res =
                      await SupabaseService.login(email.text, password.text);
                  if (res == true) {
                    final SharedPreferences access =
                        await SharedPreferences.getInstance();
                    await access.setBool('isLogin', true);
                    await access.setString('email', email.text);
                    await access.setString('password', password.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  } else {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('เข้าสู่ระบบไม่สำเร็จ'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: const <Widget>[
                                Text('กรุณาตรวจสอบอีเมล และรหัสผ่านให้ถูกต้อง'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('ปิด'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          IntrinsicHeight(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 65),
                  child: Row(
                    children: [
                      TextButton(
                        child: Text(
                          "ลืมรหัสผ่าน",
                          style: GoogleFonts.prompt(
                            color: Colors.grey[600],
                            textStyle: const TextStyle(
                              letterSpacing: .42,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPassword()),
                          );
                        },
                      )
                    ],
                  ),
                ),
                VerticalDivider(
                  color: Colors.grey,
                  width: 80,
                  thickness: 1.0,
                ),
                Row(
                  children: [
                    TextButton(
                        child: Text(
                          "สมัครสมาชิก",
                          style: GoogleFonts.prompt(
                            textStyle: const TextStyle(
                                letterSpacing: .42,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Regis()),
                          );
                        })
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
