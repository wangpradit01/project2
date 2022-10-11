import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailProfile extends StatefulWidget {
  const DetailProfile({Key? key}) : super(key: key);

  @override
  State<DetailProfile> createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
      
        backgroundColor: Color(0xff3B81FF),
        title: Text(
          "ตั้งค่าโปรไฟล์",
          style: GoogleFonts.prompt(
            textStyle: const TextStyle(
                letterSpacing: .54,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ),
      ),

      body: Column(
        children: [
          Row(
            children: [
              Container(
              margin: EdgeInsets.only(top: 24, bottom: 20),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                "ข้อมูลโปรไฟล์",
                style: GoogleFonts.prompt(
                  textStyle: TextStyle(
                      color: Color(0xff757575),
                      letterSpacing: .54,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            ],
          )
        ]),
    );
  }
}