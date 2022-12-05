import 'package:baowan/HistoryDetail.dart';
import 'package:baowan/consumption_screen.dart';
import 'package:baowan/history.dart';
import 'package:baowan/food.dart';
import 'package:baowan/services/supabase_service.dart';
import 'package:baowan/tapmanu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var date_list = [];
  bool isLoading = true;
  @override
  void initState() {
    intialAction();
    super.initState();
  }

  intialAction() async {
    date_list = await SupabaseService.getHistory();
    date_list = date_list.reversed.toList();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      appBar: _buildAppBar(),
      bottomNavigationBar: BottomNavigationBar1(),
      body: WillPopScope(
        onWillPop: () async => false,
        child: isLoading
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : ListView(
                shrinkWrap: false,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 37, bottom: 20),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "เมนูหลัก",
                      style: GoogleFonts.prompt(
                        textStyle: const TextStyle(
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () async {
                            var res = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ConsumtionScreen(),
                              ),
                            );
                            if (res) {
                              date_list = await SupabaseService.getHistory();
                              setState(() {
                                date_list = date_list.reversed.toList();
                              });
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
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
                                      textStyle: const TextStyle(
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
                                  child:
                                      Image.asset('assets/image/woman2x.png'),
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Food()));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                      textStyle: const TextStyle(
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
                                  child: Image.asset(
                                      'assets/image/bibimbap2x.png'),
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const History()));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                  child: Image.asset(
                                      'assets/image/homework2x.png'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0, bottom: 20),
                    padding: const EdgeInsets.symmetric(
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
                    height: 400,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: false,
                      itemCount: date_list.length > 5 ? 5 : date_list.length,
                      itemBuilder: (BuildContext context, int index) =>
                          GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => HistoryDetail(
                              historyData: date_list[index],
                            ),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          margin: EdgeInsets.only(bottom: 15),
                          height: 56,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 3,
                                    spreadRadius: 1,
                                    offset: Offset(1, 2),
                                    color: Color(0x11000000))
                              ]),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "${DateFormat('dd/MM/yyyy').format(DateTime.parse(date_list[index]['created_at']))}",
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
        padding: const EdgeInsets.only(left: 0),
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
