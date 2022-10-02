import 'package:baowan/detailprofile.dart';
import 'package:baowan/tapmanu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3B81FF),
        title: Text(
          "ตั้งค่า",
          style: GoogleFonts.prompt(
            textStyle: const TextStyle(
                letterSpacing: .54,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar1(),
      body: WillPopScope(
        onWillPop: () async => false,
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 37, bottom: 20),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              "การตั้งค่า",
              style: GoogleFonts.prompt(
                textStyle: TextStyle(
                    color: Color(0xff757575),
                    letterSpacing: .54,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Container(
            child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => print('tap'),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 65,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    
                  ),
                  child: Row(
                    children: [
                      Padding(
                        //padding: const EdgeInsets.all(8.0),
                        padding: EdgeInsets.only(left: 0, right: 15),
                        child: Icon(
                          Icons.account_circle,
                          size: 20,
                          color: Color(0xff3B81FF),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "ข้อมูลโปรไฟล์",
                          style: GoogleFonts.prompt(
                            textStyle: TextStyle(
                                letterSpacing: .39,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff2D2D2D)),
                          ),
                        ),
                      ),
                       IconButton(onPressed: (() {
                        Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => DetailProfile()),);
                      }), 
                      icon: Icon(Icons.arrow_forward_ios_outlined),
                      iconSize: 20,
                      color: Color(0xff757575),)
                      
                      
                      
                    ],
                  ),
                )),
          ),
          SizedBox(
            height: 3,
          ),
          Container(
            child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => print('tap'),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 65,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        //padding: const EdgeInsets.all(8.0),
                        padding: EdgeInsets.only(left: 0, right: 15),
                        child: Icon(
                          Icons.vpn_key_rounded,
                          size: 20,
                          color: Color(0xff3B81FF),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "เปลี่ยนรหัสผ่าน",
                          style: GoogleFonts.prompt(
                            textStyle: TextStyle(
                                letterSpacing: .39,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff2D2D2D)),
                          ),
                        ),
                      ),
                      
                      IconButton(onPressed: (() {
                        Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => DetailProfile()),);
                      }), 
                      icon: Icon(Icons.arrow_forward_ios_outlined),
                      iconSize: 20,
                      color: Color(0xff757575),)
                      
                      
                      
                      // Icon(
                      //   Icons.arrow_forward_ios_outlined,
                      //   size: 20,
                      //   color: Color(0xff757575),
                      // ),
                    ],
                  ),
                )),
          ),
          SizedBox(
            height: 3,
          ),
          Container(
            child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => print('tap'),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 65,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        //padding: const EdgeInsets.all(8.0),
                        padding: EdgeInsets.only(left: 0, right: 15),
                        child: Icon(
                          Icons.exit_to_app_rounded,
                          size: 20,
                          color: Color(0xff3B81FF),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "ออกจากระบบ",
                          style: GoogleFonts.prompt(
                            textStyle: TextStyle(
                                letterSpacing: .39,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff2D2D2D)),
                          ),
                        ),
                      ),
                       IconButton(onPressed: (() {
                        Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => DetailProfile()),);
                      }), 
                      icon: Icon(Icons.arrow_forward_ios_outlined),
                      iconSize: 20,
                      color: Color(0xff757575),)
                      
                      
                    ],
                  ),
                )),
          )
        ]),
      ),
    );
  }
}
