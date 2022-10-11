import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

// class Search extends StatefulWidget {
//   const Search({Key? key}) : super(key: key);

//   @override
//   _SearchState createState() => _SearchState();
// }

// class _SearchState extends State<Search> {
//   TextEditingController? _textEditingController = TextEditingController();
//   List<String> foodListOnSearch = [];
//   List<String> foodList = [
//     'ก๋วยเตี๋ยว',
//     'ก๋วยเตี๋ยวคั่วไก่',
//     'ก๋วยเตี๋ยวปากหม้อ',
//     'ก๋วยเตี๋ยวเรือ',
//     'กุนเชียง',
//     'แกงกระด้าง',
//     'แกงกะหรี่',
//     'แกงเขียวหวาน',
//     'แกงจีนจ๊วน',
//     'แกงบวน',
//     'แกงบุ่มไบ่',
//     'แกงป่า',
//     'แกงมัสมั่น',
//     'แกงเลียง',
//     'แกงส้ม',
//     'ขนมลา',
//     'ข้าวแกง',
//     'ข้าวคลุกกะปิ',
//     'ข้าวแช่',
//     'ข้าวต้ม',
//     'ข้าวตังหน้าตั้ง',
//     'ข้าวผัด',
//     'ข้าวผัดอเมริกัน',
//     'ข้าวมันไก่',
//     'ข้าวมันส้มตำ',
//     'ข้าวสวย',
//     'ข้าวเสียโป',
//     'ข้าวหน้าเป็ด',
//     'ไข่น้ำ',
//     'ค้างคาวเผือก',
//     'โจ๊ก',
//     'ชาไทย',
//     'ซอสศรีราชา',
//     'ต้มจิ๋ว',
//     'ต้มยำ',
//     'ต้มยำกุ้ง',
//     'ต้มส้ม',
//     'น้ำเงี้ยว',
//     'น้ำจิ้ม',
//     'น้ำพริก',
//     'น้ำพริกกะปิ',
//     'น้ำพริกลงเรือ',
//     'ใบเมี่ยง',
//     'ผัดกระเพรา',
//     'ผัดขี้เมา',
//     'ผัดซีอิ้ว',
//     'ผัดไทย',
//     'พริกกะเกลือ',
//     'พะโล้',
//     'แม่โขง',
//     'ราดหน้า',
//     'ลาบ',
//     'ส้มตำ',
//     'สะเต๊ะ',
//     'สัพแหยก',
//     'หมก',
//     'หมูแดง',
//     'หอยทอด',
//     'อาจาด',
//     // '',
//     // '',
//     // '',
//     // '',
//     // '',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Container(
//             decoration: BoxDecoration(
//                 color: Colors.blue.shade300,
//                 borderRadius: BorderRadius.circular(30)),
//             child: TextField(
//               onChanged: (value){
//                 setState(() {
//                   foodListOnSearch = foodList.where((element) => element.contains(value)).toList();
//                 });

//               },
//               controller: _textEditingController,
//               decoration: InputDecoration(
//                   border: InputBorder.none,
//                   errorBorder: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   contentPadding: EdgeInsets.all(15),
//                   hintText: 'Search'),
//             ),
//           ),
//         ),

//         body: ListView.builder(

//           itemCount: _textEditingController!.text.isNotEmpty? foodListOnSearch.length: foodList.length,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   CircleAvatar(
//                     child: Icon(Icons.food_bank),
//                   ),
//                   SizedBox(width: 10),
//                   Text(
//                     _textEditingController!.text.isNotEmpty? foodListOnSearch[index]: foodList[index],
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ))
//                 ],
//               ),
//             );
//           },
//         ));
//   }
// }

// class Food extends StatefulWidget {
//   const Food({Key? key}) : super(key: key);

//   @override
//   State<Food> createState() => _FoodState();
// }

// class _FoodState extends State<Food> {
//   List<Map<String, dynamic>> _allFood = [
//     {"name": "ข้าวกระเพราหมู"},
//     {"name": "ข้าวกระเพราไก่"},
//     {"name": "ข้าวกระเพรากุ้ง"},
//     {"name": "ข้าวกระเพราหมึก"},
//     {"name": "ข้าวกระเพราปลา"},
//     {"name": "ข้าวกระเพราทะเล"},
//     {"name": "ข้าวกระเพรารวมมิตร"},
//     {"name": "ข้าวกระเพราหมู"},
//     {"name": "ข้าวกระเพราหมู"},
//     {"name": "ข้าวกระเพราหมู"},
//     {"name": "ข้าวกระเพราหมู"},
//     {"name": "ข้าวกระเพราหมู"},
//     {"name": "ข้าวกระเพราหมู"},
//     {"name": "ข้าวกระเพราหมู"},
//     {"name": "ข้าวกระเพราหมู"},
//     {"name": "ข้าวกระเพราหมู"},
//     {"name": "ข้าวกระเพราหมู"},
//     {"name": "ข้าวกระเพราหมู"},
//     {"name": "ข้าวกระเพราหมู"},

//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffF3F3F3),
//       appBar: AppBar(
//         toolbarHeight: 100,

//         backgroundColor: Color(0xff3B81FF),
//         title: Text(
//           "ข้อมูลโภชนาการ",
//           style: GoogleFonts.prompt(
//             textStyle: const TextStyle(
//                 letterSpacing: .54,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.white),
//           ),
//         ),
//       ),
//       body: Container(
//         child: Column(
//           children: [
//           Container(
//             child: GestureDetector(
//                     behavior: HitTestBehavior.translucent,
//                     // onTap: () => print('tap'),
//                     child: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 20),
//                       height: 65,
//                       decoration: BoxDecoration(
//                         // borderRadius: BorderRadius.circular(10),
//                         color: Colors.white,
//                       ),
//                       child: Center(
//                         child: Container(

//                             child: TextField(
//                               style: GoogleFonts.prompt(
//                               textStyle: const TextStyle(
//                                   letterSpacing: .39,
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.black),
//                             ),
//                               decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),

//                                 hintText: "ค้นหาเมนูอาหาร",
//                                 prefixIcon: Icon(
//                                   Icons.search_rounded,),
//                                   prefixIconColor: Color(0xffAFAFAF),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(15),
//                                   borderSide: BorderSide.none)

//                                 ),

//                               ),

//                             ),

//                         ),

//                       ),

//               ),

//           ),

//       ListView.builder(
//         itemCount: _allFood.length,
//       )
//             ]

//             ),

//         ),

//         );
//   }
// }

class Food extends StatefulWidget {
  const Food({Key? key}) : super(key: key);

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {

  TextEditingController? _textEditingController = TextEditingController();
  var searchFood = [];
  // String word = "";

  // void searchOperation(String searchText) {
  //   searchFood = [];
  //   if(word != null || word != "") {
  //     for (int i = 0; i < foods.length; i++ ) {
  //       String data = foods[i];
  //       if (data.contains(searchText)) {
  //         searchFood.add(data);
  //       }
  //     }
  //   }
  // }
  @override
  void initState() {
    setState(() {
      searchFood = foods;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF3F3F3),
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Color(0xff3B81FF),
          title: Text(
            "ข้อมูลโภชนาการ",
            style: GoogleFonts.prompt(
              textStyle: const TextStyle(
                  letterSpacing: .54,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ),
        body: Column(children: [
          Container(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              // onTap: () => print('tap'),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 65,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Center(
                  child: Container(
                    child: TextField(
                      controller: _textEditingController,
                      style: GoogleFonts.prompt(
                        textStyle: const TextStyle(
                            letterSpacing: .39,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          hintText: "ค้นหาเมนูอาหาร",
                          prefixIcon: Icon(
                            Icons.search_rounded,
                          ),
                          prefixIconColor: Color(0xffAFAFAF),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none)),
                      onChanged: (value) {

                setState(() {
                  searchFood = foods.where((element) => element.contains(value)).toList();
                });




                        // setState(() {
                        //   if (text.length != 0) {
                        //     word = text;
                        //   } else {
                        //     word = "";
                        //   }
                        // });
                      
                      
                    
  }),
                ),
              ),
            ),
          ),
          
        ),
        Expanded(
              child: ListView.builder(
            itemCount: searchFood.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text(searchFood.elementAt(index)),
            ),
          ))]
        ));
  }
}

final List<String> foods = [
  "ข้าวสวย",
  "ข้าวต้ม",
  "ขนมปัง",
  "นมจืด",
  "โยเกิร์ต",
  "แอปเปิ้ลเขียว",
  "กล้วย",
  "ข้าวขาว",
  "ข้าวกล้อง",
  "ข้าวเหนียว",
  "เส้นก๋วยเตี๋ยว(เส้นบะหมี่)",
  "เส้นก๋วยเตี๋ยว(เส้นหมี่)",
  "เส้นก๋วยเตี๋ยว(เส้นเล็ก)",
  "เส้นก๋วยเตี๋ยว(เส้นใหญ่)",
  "เส้นก๋วยเตี๋ยว(วุ้นเส้น)",
  "ฟักทองสุก",
  "ข้าวโพดสุก",
  "แครอท",
  "บล็อคโคลี",
  "ดอกกะหล่ำ",
  "ข้าวโพดอ่อน",
  "กล้วยน้ำว้า",
  "ส้มเขียวหวาน",
  "แอปเปิ้ลลูกใหญ่",
  "แก้วมังกร",
  "ฝรั่ง",
  "แคนตาลูป",
  "มะละกอ",
  "สับปะรด",
  "ลองกอง",
  "ลำไย",
  "ลิ้นจี่",
  "นมจืด",
  "น้ำตาลทราย",
  "น้ำเชื่อม",
  "แครอท",
  "แครอท",
  
];
