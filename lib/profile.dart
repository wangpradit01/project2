import 'package:baowan/tapmanu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF3F3F3),
        appBar: _buildAppBar(),
        bottomNavigationBar: BottomNavigationBar1(),
        body: WillPopScope(
          onWillPop: () async => false,
          child: ListView(
            shrinkWrap: false,
            children: [
              Container(
                margin: EdgeInsets.only(top: 37, bottom: 20),
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  "เมนูหลัก",
                  style: GoogleFonts.prompt(
                    textStyle: TextStyle(
                        color: Color(0xff757575),
                        letterSpacing: .54,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
        
              //การบริโภค
              Container(
                height: 300,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => print('tap'),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 5,
                                  color: Color(0x11000000))
                            ]),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "การบริโภค",
                                style: GoogleFonts.prompt(
                                  textStyle: TextStyle(
                                      letterSpacing: .39,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            Container(
                              width: 53,
                              height: 53,
                              child: Image.asset('assets/image/woman2x.png'),
                            )
                          ],
                        ),
                      ),
                    ),
        
                    SizedBox(
                      height: 18,
                    ),
        
                    //ข้อมูลโภชนาการ
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => print('tap'),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 5,
                                  color: Color(0x11000000))
                            ]),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "ข้อมูลโภชนาการ",
                                style: GoogleFonts.prompt(
                                  textStyle: TextStyle(
                                      letterSpacing: .39,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            Container(
                              width: 53,
                              height: 53,
                              child: Image.asset('assets/image/bibimbap2x.png'),
                            )
                          ],
                        ),
                      ),
                    ),
        
                    SizedBox(
                      height: 18,
                    ),
        
                    //ประวัติการบริโภค
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => print('tap'),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 5,
                                  color: Color(0x11000000))
                            ]),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "ประวัติการบริโภค",
                                style: GoogleFonts.prompt(
                                  textStyle: TextStyle(
                                      letterSpacing: .39,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            Container(
                              width: 41,
                              height: 41,
                              child: Image.asset('assets/image/homework2x.png'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(top: 0, bottom: 20),
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  "ประวัติการบริโภคล่าสุด",
                  style: GoogleFonts.prompt(
                    textStyle: TextStyle(
                        color: Color(0xff757575),
                        letterSpacing: .54,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
        
              Container(
                height: 300,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => print('tap'),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 5,
                                  color: Color(0x11000000))
                            ]),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "08/09/65",
                                style: GoogleFonts.prompt(
                                  textStyle: TextStyle(
                                      letterSpacing: .39,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                           Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 20,
                            color: Color(0xff3B81FF),
                           ),
                          ],
                        ),
                      ),
                    ),
        
                    SizedBox(height: 13,),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => print('tap'),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 5,
                                  color: Color(0x11000000))
                            ]),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "07/09/65",
                                style: GoogleFonts.prompt(
                                  textStyle: TextStyle(
                                      letterSpacing: .39,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                           Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 20,
                            color: Color(0xff3B81FF),
                           ),
                          ],
                        ),
                      ),
                    ),
        
        
                    SizedBox(height: 13,),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => print('tap'),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 5,
                                  color: Color(0x11000000))
                            ]),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "06/09/65",
                                style: GoogleFonts.prompt(
                                  textStyle: TextStyle(
                                      letterSpacing: .39,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                           Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 20,
                            color: Color(0xff3B81FF),
                           ),
                          ],
                        ),
                      ),
                    ),
        
                    SizedBox(height: 13,),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => print('tap'),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 5,
                                  color: Color(0x11000000))
                            ]),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "05/09/65",
                                style: GoogleFonts.prompt(
                                  textStyle: TextStyle(
                                      letterSpacing: .39,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                           Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 20,
                            color: Color(0xff3B81FF),
                           ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  
                ),
              ),
            ],
          ),
        ),
        
        );
  }






  AppBar _buildAppBar() {
    return AppBar(
      toolbarHeight: 100,
      elevation: 0, //เงา appbar
      automaticallyImplyLeading: false,
      backgroundColor: Color(0xff3B81FF),
      title: Padding(
        padding: EdgeInsets.only(left: 0),
        child: Container(
          margin: EdgeInsets.only(top: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "สวัสดี",
                        style: GoogleFonts.prompt(
                          textStyle: const TextStyle(
                              letterSpacing: .54,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                      Text(
                        "ยินดีต้อนรับสู่ Baowan",
                        style: GoogleFonts.prompt(
                          textStyle: const TextStyle(
                              letterSpacing: .39,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

