import 'package:baowan/login.dart';
import 'package:baowan/services/supabase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Regis extends StatefulWidget {
  const Regis({Key? key}) : super(key: key);

  @override
  State<Regis> createState() => _RegisState();
}

class _RegisState extends State<Regis> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController birthController = TextEditingController();

  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: ListView(
            shrinkWrap: false,
            children: [
              Container(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
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
                          controller: passwordController,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
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
                          controller: repasswordController,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
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
                          controller: nameController,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
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
                          controller: surnameController,
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Text(
                  'วันเกิด',
                  style: TextStyle(
                    color: Color(0xff2D2D2D),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 35),
                decoration: BoxDecoration(
                    color: Color(0xffF3F3F3),
                    borderRadius: BorderRadius.circular(10)),
                height: 50,
                child: TextFormField(
                  controller: birthController,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2101));
                    birthController.text =
                        DateFormat('yyyy-MM-dd').format(pickedDate!);
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.calendar_month),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color(0xffD9D9D9),
                        ),
                      )),
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
                child: GestureDetector(
                  onTap: () async {
                    String errorText = '';
                    if (birthController.text == '') {
                      errorText = 'กรุณากรอกวันเกิดของคุณ';
                    }
                    if (surnameController.text == '') {
                      errorText = 'กรุณากรอกนามสกุลของคุณ';
                    }
                    if (nameController.text == '') {
                      errorText = 'กรุณากรอกชื่อของคุณ';
                    }
                    if (repasswordController.text == '') {
                      errorText = 'กรุณายืนยันรหัสผ่านของคุณ อีกครั้ง';
                    }
                    if (passwordController.text == '') {
                      errorText = 'กรุณากรอกรหัสผ่านของคุณ';
                    }
                    if (emailController.text == '') {
                      errorText = 'กรุณากรอกอีเมลของคุณ';
                    }
                    if (passwordController.text != repasswordController.text) {
                      errorText = 'รหัสผ่านไม่ตรงกัน กรุณากรอกใหม่อีกครั้ง';
                    }
                    if (errorText != '') {
                      showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('สมัครสมาชิกไม่สำเร็จ'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text(errorText),
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
                    }
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80),
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
                    var res =
                        await SupabaseService.checkEmail(emailController.text);
                    if (res.length > 0) {
                      Navigator.of(context).pop();
                      showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('สมัครสมาชิกไม่สำเร็จ'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text('อีเมลซ้ำกัน กรุณากรอกใหม่อีกครั้ง'),
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
                    var res_data = await SupabaseService.createAccount(
                        email: emailController.text,
                        password: passwordController.text,
                        birth: birthController.text,
                        isMale: isMale,
                        name:
                            '${nameController.text} ${surnameController.text}');
                    Navigator.of(context).pop();
                    if (res_data.length > 0) {
                      await showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('สมัครสมาชิกสำเร็จ'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text(
                                      'คุณสามารถลงชื่อเข้าใช้ได้แล้ว ณ ขณะนี้'),
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
                      Navigator.pop(context);
                    }
                  },
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
              ),
              SizedBox(
                height: 35,
              ),
            ],
          ),
        ));
  }
}
