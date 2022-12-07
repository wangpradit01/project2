import 'package:baowan/services/supabase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  TextEditingController newController = TextEditingController();
  TextEditingController againController = TextEditingController();
  bool isConfirmEmail = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isConfirmEmail == false
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      // margin: EdgeInsets.only(top: 15, bottom: 50),
                      padding: EdgeInsets.only(left: 15, right: 5),
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
                              );
                            },
                            icon: Icon(Icons.close),
                            iconSize: 25,
                          ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "ลืมรหัสผ่าน",
                            style: GoogleFonts.prompt(
                                textStyle: TextStyle(
                                    letterSpacing: .66,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "กรุณาใส่ข้อมูล ระบบจะจัดส่งไปที่อีเมลของคุณ",
                            style: GoogleFonts.prompt(
                                textStyle: TextStyle(
                              color: Colors.grey[600],
                              letterSpacing: .39,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "อีเมล",
                            textAlign: TextAlign.start,
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
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Example@email.com"),
                              style: GoogleFonts.prompt(
                                textStyle: const TextStyle(
                                    letterSpacing: .39,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () async {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 80),
                              child: AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircularProgressIndicator(),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Please wait',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                        var res = await SupabaseService.checkEmail(
                            emailController.text);
                        Navigator.pop(context);
                        if (res.length == 0) {
                          showDialog<void>(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('ไม่สำเร็จ'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: const <Widget>[
                                      Text(
                                          'ไม่พบอีเมลของคุณ กรุณาตรวจสอบอีเมล'),
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
                        } else {
                          setState(() {
                            isConfirmEmail = true;
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'ตกลง',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          : SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              ),
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
                            );
                          },
                          icon: Icon(Icons.close),
                          iconSize: 25,
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'รหัสผ่านใหม่',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: newController,
                      obscureText: true,
                      onTap: () {
                        newController.clear();
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffD9D9D9),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'รหัสผ่านใหม่อีกครั้ง',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: againController,
                      obscureText: true,
                      onTap: () {
                        againController.clear();
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffD9D9D9),
                            ),
                          )),
                    ),
                    Expanded(child: Container()),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () async {
                        if (newController.text != againController.text) {
                          showDialog<void>(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('ไม่สำเร็จ'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: const <Widget>[
                                      Text(
                                          'รหัสผ่านไม่ตรงกัน กรุณากรอกใหม่อีกครั้ง'),
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
                          return;
                        } else {
                          showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 80),
                                child: AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircularProgressIndicator(),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Please wait',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                          await SupabaseService.resetPassword(
                              emailController.text, newController.text);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'ตกลง',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
