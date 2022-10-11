import 'package:baowan/tapmanu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Alarm extends StatefulWidget {
  const Alarm({Key? key}) : super(key: key);

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF3F3F3),
        appBar: AppBar(
          toolbarHeight: 100,
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff3B81FF),
          title: Text(
            "เตือนความจำ",
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
          child: Column(
            children: [
              GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => print('tap'),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 56,
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              spreadRadius: 5,
                              color: Color(0x11000000))
                        ]),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.edit,
                                  size: 17, color: Color(0xffAFAFAF)),
                              Text(
                                "แก้ไข",
                                style: GoogleFonts.prompt(
                                  textStyle: TextStyle(
                                      letterSpacing: .39,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffAFAFAF)),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return Container(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text('Time'),
                                            )
                                          ],
                                        ),
                                        CupertinoTimerPicker(
                                          onTimerDurationChanged: (value) {},
                                        ),
                                        Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text("ชื่อการเตือน")),
                                        TextFormField(),
                                        Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text("การปลุกซ้ำ")),
                                        TextFormField(),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child:
                                                    Text('สถานะการแจ้งเตือน')),
                                            CupertinoSwitch(
                                                value: true,
                                                onChanged: ((value) {}))
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: SizedBox(
                                                height: 40,
                                                child: ElevatedButton(
                                                    child: Text('เพิ่ม'),
                                                    onPressed: () {}),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30,
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_circle,
                                  size: 20,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "เพิ่มการเตือน",
                                  style: GoogleFonts.prompt(
                                    textStyle: TextStyle(
                                        letterSpacing: .39,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff3B81FF)),
                                  ),
                                )
                              ],
                            ),
                          )
                        ]),
                  )),
              Expanded(
                  child: Container(
                alignment: Alignment.center,
                child: Text(
                  "ยังไม่มีการเตือนความจำ",
                  style: GoogleFonts.prompt(
                    textStyle: TextStyle(
                        letterSpacing: .39,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffAFAFAF)),
                  ),
                ),
                //color: Colors.red,
              ))
            ],
          ),
        ));
  }
}
