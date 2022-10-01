import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
        body: ListView(
          shrinkWrap: false,
          children: [
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 50),
              padding: EdgeInsets.only(left: 35, right: 25),
              //left,right เป็นตำแน่งความข้างจากด้านซ้ายตัวแรก,ความข้างจากด้านขวาของอันหลัง
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //ระหว่างตัวแรกและตัวที่2 ของ header
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Wrap(
                          children: List.generate(
                            1,
                            (index) => SvgPicture.asset(
                                "assets/icons/LOGO BAOWAN.svg"),
                          ),
                        ),
                        SizedBox(
                          width: 13.23,
                        ), //ตัวเว้นระยะห่างด้านบน
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
                  ),
                  Center(
                      child: IconButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    icon: Icon(Icons.close),
                    iconSize: 25,
                  ))
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text("ลืมรหัสผ่าน",
                  style: GoogleFonts.prompt(
                    textStyle: TextStyle(
                      letterSpacing: .66,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                    )
                  ),),
SizedBox(height: 5,),
                  Text("กรุณาใส่ข้อมูล ระบบจะจัดส่งไปที่อีเมลของคุณ",
                  style: GoogleFonts.prompt(
                    textStyle: TextStyle(
                      color: Colors.grey[600],
                      letterSpacing: .39,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              
                    )
                  ),),
                ],
              ),
            ),
SizedBox(height: 40,),
            Container(
              padding: EdgeInsets.only(
                left: 35,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "อีเมล",
                    style: GoogleFonts.prompt(
                      textStyle: const TextStyle(
                          letterSpacing: .42,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Example@email.com"),
                        style: GoogleFonts.prompt(
                          textStyle: const TextStyle(
                              letterSpacing: .39,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),

            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  "ยืนยัน",
                  style: GoogleFonts.prompt(
                    textStyle: const TextStyle(
                        letterSpacing: .39,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
  ]
  ),
  );
  }
}
