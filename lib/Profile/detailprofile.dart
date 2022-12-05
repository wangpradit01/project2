import 'package:baowan/Data/GlobalVar.dart';
import 'package:baowan/Profile/EditProfile.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
      body: ListView(
        shrinkWrap: false,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
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
              ),
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () async {
                    var res = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => EditProfile(
                          data: profile,
                        ),
                      ),
                    );
                    // setState(() {
                    //   json = res;
                    // });
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 24, bottom: 20),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                        Text(
                          "แก้ไขโปรไฟล์",
                          style: GoogleFonts.prompt(
                            textStyle: TextStyle(
                                color: Colors.blue,
                                letterSpacing: .54,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 120,
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/image/woman3x.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Icon(
                  Icons.account_circle_sharp,
                  color: Color(0xff757575),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'ชื่อ - สกุล',
                  style: TextStyle(
                    color: Color(0xff757575),
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 55.0,
              bottom: 10,
            ),
            child: Text(
              '${profile!.name}',
              style: TextStyle(
                color: Color(0xff2D2D2D),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Icon(
                  Icons.email,
                  color: Color(0xff757575),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'อีเมล',
                  style: TextStyle(
                    color: Color(0xff757575),
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 55.0,
              bottom: 10,
            ),
            child: Text(
              '${profile!.email}',
              style: TextStyle(
                color: Color(0xff2D2D2D),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Icon(
                  Icons.celebration,
                  color: Color(0xff757575),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'วันเกิด',
                  style: TextStyle(
                    color: Color(0xff757575),
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 55.0,
              bottom: 10,
            ),
            child: Text(
              '${profile!.birth}',
              style: TextStyle(
                color: Color(0xff2D2D2D),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Icon(
                  Icons.male,
                  color: Color(0xff757575),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'เพศ',
                  style: TextStyle(
                    color: Color(0xff757575),
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 55.0,
              bottom: 10,
            ),
            child: Text(
              profile!.gender == 0 ? "ชาย" : "หญิง",
              style: TextStyle(
                color: Color(0xff2D2D2D),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          // Container(
          //   padding: const EdgeInsets.only(left: 20.0),
          //   margin: EdgeInsets.only(top: 10),
          //   child: Row(
          //     children: [
          //       Icon(
          //         Icons.bloodtype,
          //         color: Color(0xff757575),
          //       ),
          //       SizedBox(
          //         width: 10,
          //       ),
          //       Text(
          //         'ประเภทเบาหวาน',
          //         style: TextStyle(
          //           color: Color(0xff757575),
          //           fontWeight: FontWeight.w600,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: 5,
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //     left: 55.0,
          //     bottom: 10,
          //   ),
          //   child: Text(
          //     '${json['type']}',
          //     style: TextStyle(
          //       color: Color(0xff2D2D2D),
          //       fontWeight: FontWeight.w600,
          //     ),
          //   ),
          // ),
          // const Divider(
          //   thickness: 1,
          // ),
          SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }
}
