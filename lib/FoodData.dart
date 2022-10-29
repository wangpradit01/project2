import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodData extends StatefulWidget {
  const FoodData({
    Key? key,
    required this.foodTitle,
    required this.foodImage,
    required this.foodDetail,
    required this.foodProteinDetail,
    required this.foodCal,
    required this.foodCarb,
    required this.foodProtein,
    required this.foodCalDetail,
  }) : super(key: key);
  final String foodTitle;
  final String foodImage;
  final String foodDetail;
  final String foodProteinDetail;
  final double foodCal;
  final double foodCarb;
  final String foodCalDetail;
  final double foodProtein;

  @override
  State<FoodData> createState() => _FoodDataState();
}

class _FoodDataState extends State<FoodData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            '${widget.foodTitle}',
            style: GoogleFonts.prompt(
              textStyle: const TextStyle(
                  letterSpacing: .54,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          actions: []),
      body: ListView(
        shrinkWrap: false,
        children: [
          Image.network(
            '${widget.foodImage}',
            
          ),
          SizedBox(
            height: 35,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'ปริมาณอาหารต่อ 1 คาร์บ :',
                    style: GoogleFonts.prompt(
                      textStyle: const TextStyle(
                          letterSpacing: .54,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Text(
                    '${widget.foodCarb}',
                    style: GoogleFonts.prompt(
                  textStyle: const TextStyle(
                      letterSpacing: .54,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    '${widget.foodDetail}',
                    style: GoogleFonts.prompt(
                  textStyle: const TextStyle(
                      letterSpacing: .54,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                    ),
                  )
                  
                ],
              ),
              SizedBox(height: 20,),
              Row(
               
                children: [
                  SizedBox(width: 20,),
                  Text(
                'ปริมาณโปรตีน : ',
                style: GoogleFonts.prompt(
                  textStyle: const TextStyle(
                      letterSpacing: .54,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              SizedBox(width: 15,),
              Text(
                    '${widget.foodProtein}',
                    style: GoogleFonts.prompt(
                      textStyle: const TextStyle(
                          letterSpacing: .54,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Text(
                    '${widget.foodProteinDetail}',
                    style: GoogleFonts.prompt(
                      textStyle: const TextStyle(
                          letterSpacing: .54,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
               
                children: [
                  SizedBox(width: 20,),
                  Text(
                'ปริมาณแคลโลรี : ',
                style: GoogleFonts.prompt(
                  textStyle: const TextStyle(
                      letterSpacing: .54,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              SizedBox(width: 15,),
              Text(
                    '${widget.foodCal}',
                    style: GoogleFonts.prompt(
                      textStyle: const TextStyle(
                          letterSpacing: .54,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Text(
                    '${widget.foodCalDetail}',
                    style: GoogleFonts.prompt(
                      textStyle: const TextStyle(
                          letterSpacing: .54,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
