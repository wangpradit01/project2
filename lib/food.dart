import 'package:baowan/Data/FoodList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import 'FoodData.dart';

class Food extends StatefulWidget {
  const Food({Key? key}) : super(key: key);

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  TextEditingController? _textEditingController = TextEditingController();
  List<dynamic> searchFood = [];
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
        backgroundColor: Colors.white,
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
          SizedBox(
            height: 10,
          ),
          Container(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              // onTap: () => print('tap'),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
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
                                borderSide: BorderSide(color: Colors.grey))),
                        onChanged: (value) {
                          setState(() {
                            searchFood = foods
                                .where((element) =>
                                    element["food_name"].contains(value))
                                .toList();
                          });
                        }),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: searchFood.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodData(
                      foodTitle: searchFood[index]['food_name'],
                      foodDetail: searchFood[index]['food_detail'],
                      foodProteinDetail: searchFood[index]
                          ['food_protein_detail'],
                      foodImage: searchFood[index]['food_img'],
                      foodCal: searchFood[index]['food_cal'],
                      foodCarb: searchFood[index]['food_carb'],
                      foodProtein: searchFood[index]['food_protein'],
                      foodCalDetail: searchFood[index]['food_cal_detail'],
                    ),
                  )),
              title: Text(
                '${searchFood[index]['food_name']}',
                style: GoogleFonts.prompt(
                  textStyle: const TextStyle(
                      letterSpacing: .39,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),
          ))
        ]));
  }
}
