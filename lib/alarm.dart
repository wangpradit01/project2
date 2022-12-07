import 'dart:io';

import 'package:baowan/services/supabase_service.dart';
import 'package:baowan/tapmanu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Alarm extends StatefulWidget {
  const Alarm({Key? key}) : super(key: key);

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  List notiList = [];
  DateTime tempTime = DateTime.now();
  String? tempNotiName = '';
  bool? tempNotistatus = true;
  bool? isEdit = false;

  bool isLoading = true;
  @override
  void initState() {
    intialAction();
    super.initState();
  }

  intialAction() async {
    final res = await SupabaseService.getClock();
    setState(() {
      isLoading = false;
      notiList = res;
    });
    for (var i = 0; i < notiList.length; i++) {
      if (notiList[i]['status']) {
        DateTime date = DateTime.parse(notiList[i]['time']);
        if (Platform.isAndroid) {
          FlutterAlarmClock.createAlarm(date.hour, date.minute);
        }
      }
    }
  }

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
          child: isLoading == true
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : ListView(
                  children: [
                    GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() {
                            isEdit = !isEdit!;
                          });
                        },
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
                                    isEdit == true
                                        ? Container()
                                        : Icon(Icons.edit,
                                            size: 17,
                                            color: notiList.length == 0
                                                ? Color(0xffAFAFAF)
                                                : Colors.blue),
                                    Text(
                                      isEdit == true ? "เสร็จสิ้น" : "แก้ไข",
                                      style: GoogleFonts.prompt(
                                        textStyle: TextStyle(
                                            letterSpacing: .39,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: notiList.length == 0
                                                ? Color(0xffAFAFAF)
                                                : isEdit == true
                                                    ? Colors.red
                                                    : Colors.blue),
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
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(20),
                                                width: double.maxFinite,
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: const Text(
                                                        'เพิ่มการเตือนความจำ',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned.fill(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context, false);
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.maxFinite,
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Icon(
                                                            Icons.close,
                                                            color: Color(
                                                                0xffB3B3B3),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.4,
                                                child: CupertinoDatePicker(
                                                  backgroundColor:
                                                      Color(0xffF3F3F3),
                                                  initialDateTime:
                                                      DateTime.now().add(
                                                          Duration(
                                                              minutes: 10)),
                                                  mode: CupertinoDatePickerMode
                                                      .time,
                                                  use24hFormat: true,
                                                  onDateTimeChanged:
                                                      (DateTime newTime) {
                                                    setState(() =>
                                                        tempTime = newTime);
                                                  },
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(20),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                            "ชื่อการเตือน")),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    TextFormField(
                                                      onChanged: (text) {
                                                        setState(() {
                                                          tempNotiName = text;
                                                        });
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'การเตือนความจำ',
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    vertical: 2,
                                                                    horizontal:
                                                                        15),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xffE6E6E6),
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                            child: Text(
                                                                'สถานะการแจ้งเตือน')),
                                                        Transform.scale(
                                                          scale: 0.8,
                                                          child:
                                                              CupertinoSwitch(
                                                                  activeColor:
                                                                      Colors
                                                                          .blue,
                                                                  value: true,
                                                                  onChanged:
                                                                      ((value) {
                                                                    tempNotistatus =
                                                                        value;
                                                                  })),
                                                        )
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
                                                            child:
                                                                ElevatedButton(
                                                                    child: Text(
                                                                        'บันทึก'),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context,
                                                                          true);
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
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                    if (res == true) {
                                      var res = await SupabaseService.addClock(
                                          active: tempNotistatus,
                                          time: tempTime,
                                          note: tempNotiName);
                                      setState(() {
                                        notiList.add(res);
                                        if (Platform.isAndroid) {
                                          FlutterAlarmClock.createAlarm(
                                              tempTime.hour, tempTime.minute,
                                              title: tempNotiName == ''
                                                  ? 'ไม่มีคำบรรยาย'
                                                  : tempNotiName!);
                                        }
                                        tempNotistatus = true;
                                        tempNotiName = '';
                                      });
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
                        ? Container(
                            height: MediaQuery.of(context).size.height * 0.65,
                            child: Center(
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
                            ),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: ListView.builder(
                              itemCount: notiList.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey.withOpacity(0.4)),
                                )),
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 15),
                                child: Row(
                                  children: [
                                    isEdit == true
                                        ? GestureDetector(
                                            onTap: () async {
                                              await SupabaseService.deleteClock(
                                                  notiList[index]['id']);
                                              setState(() {
                                                notiList.removeAt(index);
                                              });
                                            },
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(right: 15),
                                              child: Icon(
                                                Icons.do_not_disturb_on,
                                                color: Colors.red,
                                              ),
                                            ),
                                          )
                                        : Container(),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${DateFormat('HH:mm').format(notiList[index]['time'] is DateTime ? notiList[index]['time'] : DateTime.parse(notiList[index]['time']))}',
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: notiList[index]
                                                          ['status'] ==
                                                      true
                                                  ? Colors.black
                                                  : Color(0xff999999),
                                              letterSpacing: 1.5,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            notiList[index]['note'] == ''
                                                ? 'ไม่มีคำบรรยาย'
                                                : notiList[index]['note'],
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: notiList[index]
                                                          ['status'] ==
                                                      true
                                                  ? Color(0xff666666)
                                                  : Color(0xff999999),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    isEdit == true
                                        ? Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.grey.withOpacity(0.5),
                                          )
                                        : Transform.scale(
                                            scale: 0.8,
                                            child: CupertinoSwitch(
                                              activeColor: Colors.blue,
                                              value: notiList[index]['status'],
                                              onChanged: ((value) async {
                                                await SupabaseService
                                                    .editClockStatus(
                                                        notiList[index]['id'],
                                                        value);
                                                setState(() {
                                                  if (value == true) {
                                                    DateTime time =
                                                        DateTime.parse(
                                                            notiList[index]
                                                                ['time']);
                                                    if (Platform.isAndroid) {
                                                      FlutterAlarmClock
                                                          .createAlarm(
                                                              time.hour,
                                                              time.minute);
                                                    }
                                                  }
                                                  notiList[index]['status'] =
                                                      value;
                                                });
                                              }),
                                            ),
                                          )
                                  ],
                                ),
                              ),
                            ),
                          )
                  ],
                ),
        ));
  }
}
