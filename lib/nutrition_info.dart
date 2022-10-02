import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class NutritionInfo extends StatefulWidget {
  const NutritionInfo({Key? key}) : super(key: key);

  @override
  State<NutritionInfo> createState() => _NutritionInfoState();
}

class _NutritionInfoState extends State<NutritionInfo> {
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
      body: Container(
        child: Column(
          children: [
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
                              style: GoogleFonts.prompt(
                              textStyle: const TextStyle(
                                  letterSpacing: .39,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                                
                                hintText: "ค้นหาเมนูอาหาร",
                                prefixIcon: Icon(
                                  Icons.search_rounded,),
                                  prefixIconColor: Color(0xffAFAFAF),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none)
                                  
                                ),
                                
                              ),
                              
                              
                              
                            ),
                           
                            
                            
                          
                        ),
                        
                      ),
                    
              ),
             
          ),
          
      
            ]
          
            ),
        
          
        
        ),
        );
  }
}


