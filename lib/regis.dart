import 'package:baowan/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class Regis extends StatefulWidget {
  const Regis({Key? key}) : super(key: key);

  @override
  State<Regis> createState() => _RegisState();
}

class _RegisState extends State<Regis> {
  bool isMale = true;
  bool isBaowan = true;

 
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
            Column(
              children: [
                Text(
                  "สมัครสมาชิก",
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
                  "กรุณาใส่ข้อมูลของคุณ เพื่อทำการสมัครสมาชิก",
                  style: GoogleFonts.prompt(
                    color: Colors.grey[600],
                    textStyle: const TextStyle(
                      letterSpacing: .43,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
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
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 35,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "รหัสผ่าน",
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
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 35,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ยืนยันรหัสผ่าน",
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
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Confirm Password"),
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
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 35,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ชื่อ",
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
                            border: InputBorder.none, hintText: "ชื่อของคุณ"),
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
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 35,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "นามสกุล",
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
                            hintText: "นามสกุลของคุณ"),
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
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 35,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "เพศ",
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
            SizedBox(
              height: 5,
            ),
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Row(
                      children: [
                        Container(
                            // padding: const EdgeInsets.all(25),
                            width: 320,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    child: SizedBox(
                                  width: 35,
                                  height: 60,
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      side: isMale
                                          ? BorderSide(
                                              color: Colors.blue, width: 2)
                                          : BorderSide(
                                              color: Colors.grey, width: 0),
                                      backgroundColor: Colors.white,
                                    ),
                                    child: Text(
                                      "ชาย",
                                      style: GoogleFonts.prompt(
                                        textStyle: TextStyle(
                                          color: isMale
                                              ? Colors.blue
                                              : Colors.grey,
                                          letterSpacing: .42,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isMale = true;
                                      });
                                    },
                                  ),
                                )),
                                Expanded(
                                    child: SizedBox(
                                  width: 35,
                                  height: 60,
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      side: !isMale
                                          ? BorderSide(
                                              color: Colors.blue, width: 2)
                                          : BorderSide(
                                              color: Colors.grey, width: 0),
                                      backgroundColor: Colors.white,
                                    ),
                                    child: Text(
                                      "หญิง",
                                      style: GoogleFonts.prompt(
                                        textStyle: TextStyle(
                                          color: !isMale
                                              ? Colors.blue
                                              : Colors.grey,
                                          letterSpacing: .42,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isMale = false;
                                      });
                                    },
                                  ),
                                ))
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 35,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "อายุ",
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
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "อายุของคุณ"),
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
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 35,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ชนิดเบาหวาน",
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
            SizedBox(
              height: 5,
            ),
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Row(
                      children: [
                        Container(
                            // padding: const EdgeInsets.all(25),
                            width: 320,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    child: SizedBox(
                                  width: 35,
                                  height: 60,
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      side: isBaowan
                                          ? BorderSide(
                                              color: Colors.blue, width: 2)
                                          : BorderSide(
                                              color: Colors.grey, width: 0),
                                      backgroundColor: Colors.white,
                                    ),
                                    child: Text(
                                      "ชนิดที่ 1",
                                      style: GoogleFonts.prompt(
                                        textStyle: TextStyle(
                                          color: isMale
                                              ? Colors.blue
                                              : Colors.grey,
                                          letterSpacing: .42,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isBaowan = true;
                                      });
                                    },
                                  ),
                                )),
                                Expanded(
                                    child: SizedBox(
                                  width: 35,
                                  height: 60,
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      side: !isBaowan
                                          ? BorderSide(
                                              color: Colors.blue, width: 2)
                                          : BorderSide(
                                              color: Colors.grey, width: 0),
                                      backgroundColor: Colors.white,
                                    ),
                                    child: Text(
                                      "ชนิดที่ 2",
                                      style: GoogleFonts.prompt(
                                        textStyle: TextStyle(
                                          color: !isBaowan
                                              ? Colors.blue
                                              : Colors.grey,
                                          letterSpacing: .42,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isBaowan = false;
                                      });
                                    },
                                  ),
                                ))
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: Column(
                children: [
                  Divider(
                    color: Colors.grey[500],
                  )
                ],
              ),
            ),
            
            SizedBox(
              height: 10,
            ),
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
                    "สมัครสมาชิก",
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
            
          ],
        ));
  }
}
