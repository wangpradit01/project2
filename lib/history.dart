import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:flutter/material.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              padding: EdgeInsets.symmetric(
                horizontal: 5,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                "ปีที่ค้นหา",
                style: GoogleFonts.prompt(
                  textStyle: TextStyle(
                      color: Color(0xff757575),
                      letterSpacing: .54,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            
            InputDecorator(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.0)),
                contentPadding: const EdgeInsets.all(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedCourseValue,
                  isDense: true,
                  isExpanded: true,
                  menuMaxHeight: 3200,
                  items: [
                    const DropdownMenuItem(
                        child: Text(
                          "Select Course",
                          
                        ),
                        value: ""),
                    ...dropDownListData.map<DropdownMenuItem<String>>((e) {
                      return DropdownMenuItem(
                          child: Text(e['title']), value: e['value']);
                    }).toList(),
                  ],
                  onChanged: (newValue) {
                    setState(
                      () {
                        selectedCourseValue = newValue!;
                        print(selectedCourseValue);
                      },
                    );
                  },
                ),
              ),
            ),

            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              padding: EdgeInsets.symmetric(
                horizontal: 5,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                "เดือน",
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
        ),
      ),
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