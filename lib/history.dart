import 'package:baowan/HistoryDetail.dart';
import 'package:baowan/services/supabase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => HistoryState();
}

class HistoryState extends State<History> {
  List dropDownListData = [
    {"title": "2019", "value": "1"},
    {"title": "2020", "value": "2"},
    {"title": "2021", "value": "3"},
    {"title": "2022", "value": "4"},
  ];

  var date_list = [];
  bool isLoading = true;
  @override
  void initState() {
    intialAction();
    super.initState();
  }

  intialAction() async {
    date_list = await SupabaseService.getHistory();
    date_list.reversed;
    print("data list: $date_list");
    setState(() {
      isLoading = false;
    });
  }

  String selectedCourseValue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color(0xff3B81FF),
        title: Text(
          "ประวัติโภชนาการ",
          style: GoogleFonts.prompt(
            textStyle: const TextStyle(
                letterSpacing: .54,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ),
      ),
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child:
                  // ListView(
                  //   children: [
                  //     Container(
                  //       margin: EdgeInsets.only(top: 20, bottom: 20),
                  //       padding: EdgeInsets.symmetric(
                  //         horizontal: 5,
                  //       ),
                  //       alignment: Alignment.centerLeft,
                  //       child: Text(
                  //         "ปีที่ค้นหา",
                  //         style: GoogleFonts.prompt(
                  //           textStyle: TextStyle(
                  //               color: Color(0xff757575),
                  //               letterSpacing: .54,
                  //               fontSize: 16,
                  //               fontWeight: FontWeight.w600),
                  //         ),
                  //       ),
                  //     ),

                  //     InputDecorator(
                  //       decoration: InputDecoration(
                  //         border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(7.0)),
                  //         contentPadding: const EdgeInsets.all(10),
                  //       ),
                  //       child: DropdownButtonHideUnderline(
                  //         child: DropdownButton<String>(
                  //           value: selectedCourseValue,
                  //           isDense: true,
                  //           isExpanded: true,
                  //           menuMaxHeight: 3200,
                  //           items: [
                  //             const DropdownMenuItem(
                  //                 child: Text(
                  //                   "Select Course",

                  //                 ),
                  //                 value: ""),
                  //             ...dropDownListData.map<DropdownMenuItem<String>>((e) {
                  //               return DropdownMenuItem(
                  //                   child: Text(e['title']), value: e['value']);
                  //             }).toList(),
                  //           ],
                  //           onChanged: (newValue) {
                  //             setState(
                  //               () {
                  //                 selectedCourseValue = newValue!;
                  //                 print(selectedCourseValue);
                  //               },
                  //             );
                  //           },
                  //         ),
                  //       ),
                  //     ),

                  //     SizedBox(height: 20,),
                  //     Container(
                  //       margin: EdgeInsets.only(top: 20, bottom: 20),
                  //       padding: EdgeInsets.symmetric(
                  //         horizontal: 5,
                  //       ),
                  //       alignment: Alignment.centerLeft,
                  //       child: Text(
                  //         "เดือน",
                  //         style: GoogleFonts.prompt(
                  //           textStyle: TextStyle(
                  //               color: Color(0xff757575),
                  //               letterSpacing: .54,
                  //               fontSize: 16,
                  //               fontWeight: FontWeight.w600),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  ListView.builder(
                shrinkWrap: false,
                itemCount: date_list.length,
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
              )),
    );
  }
}





























// class History extends StatefulWidget {
//   const History({Key? key}) : super(key: key);

//   @override
//   State<History> createState() => _HistoryState();
// }

// class _HistoryState extends State<History> {




//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffEFEFEF),
//       appBar: AppBar(
//         toolbarHeight: 100,
      
//         backgroundColor: Color(0xff3B81FF),
//         title: Text(
//           "ประวัติการบริโภค",
//           style: GoogleFonts.prompt(
//             textStyle: const TextStyle(
//                 letterSpacing: .54,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.white),
//           ),
//         ),
//       ),
//       body: ListView(
//         shrinkWrap: false,
//           children: [
//             Container(
//               margin: EdgeInsets.only(top: 37, bottom: 20),
//               padding: EdgeInsets.symmetric(
//                 horizontal: 20,
//               ),
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "ปีที่ค้นหา",
//                 style: GoogleFonts.prompt(
//                   textStyle: TextStyle(
//                       color: Color(0xff757575),
//                       letterSpacing: .54,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600),
//                 ),
//               ),
//             ),
            
            
//       ]),
//     );
//   }
// }