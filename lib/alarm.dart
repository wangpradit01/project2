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
  List notiList = [];
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
          child: ListView(
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
                            onTap: () async {
                              var res = await showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  Duration time = Duration(hours: 0);
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
                                          onTimerDurationChanged: (value) {
                                            time = value;
                                          },
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
                                                    onPressed: () {
                                                      Navigator.pop(context, time!);
                                                    }),
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
                              if(res == Duration(hours: 0))
                              {

                              } else {
                                setState(() {
                                  notiList.add(res);
                                });
                                // notiList.add(res);
                              }
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
              notiList.length == 0
                  ? Text(
                      "ยังไม่มีการเตือนความจำ",
                      style: GoogleFonts.prompt(
                        textStyle: TextStyle(
                            letterSpacing: .39,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffAFAFAF)),
                      ),
                    )
                  : Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.builder(
                      itemCount: notiList.length,
                      itemBuilder: (BuildContext context, int index) =>
                          ListTile(
                        title: Text('${notiList[index]}'),
                      ),
                    ))
            ],
          ),
        ));
  }
}
