import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class ConsumtionScreen extends StatefulWidget {
  const ConsumtionScreen({Key? key}) : super(key: key);

  @override
  State<ConsumtionScreen> createState() => _ConsumtionScreenState();
}

class _ConsumtionScreenState extends State<ConsumtionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
      
        backgroundColor: Color(0xff3B81FF),
        title: Text(
          "การบริโภค",
          style: GoogleFonts.prompt(
            textStyle: const TextStyle(
                letterSpacing: .54,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child:  Container(
              color: Colors.white,
              child: Center(
                child: Text(
                  "วันที่ 08 กันยายน 2565",
                  style: GoogleFonts.prompt(
                    textStyle: const TextStyle(
                        letterSpacing: 0.66,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue
                      )
                  ),
                ),
              ),
            )
          ),
          Expanded(
            flex: 10,
            child: SingleChildScrollView(
              child: Container(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "มื้อเช้า",
                        style: GoogleFonts.prompt(
                          textStyle: const TextStyle(
                              letterSpacing: 0.66,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54
                            )
                        ),
                        textAlign: TextAlign.start,
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ผลวัดระดับน้ำตาลก่อนอาหาร",
                            style: GoogleFonts.prompt(
                              textStyle: const TextStyle(
                                  letterSpacing: 0.66,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                                )
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                            child: TextField( 
                              textAlignVertical: TextAlignVertical.center,
                              style: GoogleFonts.prompt(
                                textStyle: const TextStyle(
                                    letterSpacing: 0.66,
                                    fontSize: 16,
                                    color: Colors.black54
                                  ),
                              ),
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                hintText: "0"
                              ),
                            )
                          )
                        ],
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "อาหารที่ทาน",
                            style: GoogleFonts.prompt(
                              textStyle: const TextStyle(
                                  letterSpacing: 0.66,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                                )
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                            child: TextField( 
                              textAlignVertical: TextAlignVertical.center,
                              style: GoogleFonts.prompt(
                                textStyle: const TextStyle(
                                    letterSpacing: 0.66,
                                    fontSize: 16,
                                    color: Colors.black54
                                  ),
                              ),
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                hintText: "เลือกอาหารที่ทาน",
                                suffixIcon: IconButton(
                                  onPressed: null, 
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.blue,
                                    size: 20.0,
                                  )
                                )
                              ),
                            )
                          )
                        ],
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ชนิดแป้งที่ทาน",
                            style: GoogleFonts.prompt(
                              textStyle: const TextStyle(
                                  letterSpacing: 0.66,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                                )
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                            child: TextField( 
                              textAlignVertical: TextAlignVertical.center,
                              style: GoogleFonts.prompt(
                                textStyle: const TextStyle(
                                    letterSpacing: 0.66,
                                    fontSize: 16,
                                    color: Colors.black54
                                  ),
                              ),
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                hintText: "เลือกแป้งที่ทาน",
                                suffixIcon: IconButton(
                                  onPressed: null, 
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.blue,
                                    size: 20.0,
                                  )
                                )
                              ),
                            )
                          )
                        ],
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "สรุปผลโภชนาการ",
                            style: GoogleFonts.prompt(
                              textStyle: const TextStyle(
                                  letterSpacing: 0.66,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                                )
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "คาร์โบไฮเดรต",
                                    style: GoogleFonts.prompt(
                                      textStyle: const TextStyle(
                                          letterSpacing: 0.66,
                                          fontSize: 16,
                                          color: Colors.black54
                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    width: 100.0,
                                    child: TextField( 
                                      textAlignVertical: TextAlignVertical.center,
                                      style: GoogleFonts.prompt(
                                        textStyle: const TextStyle(
                                            letterSpacing: 0.66,
                                            fontSize: 16,
                                            color: Colors.black54
                                          ),
                                      ),
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                                        ),
                                        contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                        hintText: "0"
                                      ),
                                    )
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "โปรตีน",
                                    style: GoogleFonts.prompt(
                                      textStyle: const TextStyle(
                                          letterSpacing: 0.66,
                                          fontSize: 16,
                                          color: Colors.black54
                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    width: 100.0,
                                    child: TextField( 
                                      textAlignVertical: TextAlignVertical.center,
                                      style: GoogleFonts.prompt(
                                        textStyle: const TextStyle(
                                            letterSpacing: 0.66,
                                            fontSize: 16,
                                            color: Colors.black54
                                          ),
                                      ),
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                                        ),
                                        contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                        hintText: "0"
                                      ),
                                    )
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "คอเรสเตอรอล",
                                    style: GoogleFonts.prompt(
                                      textStyle: const TextStyle(
                                          letterSpacing: 0.66,
                                          fontSize: 16,
                                          color: Colors.black54
                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    width: 100.0,
                                    child: TextField( 
                                      textAlignVertical: TextAlignVertical.center,
                                      style: GoogleFonts.prompt(
                                        textStyle: const TextStyle(
                                            letterSpacing: 0.66,
                                            fontSize: 16,
                                            color: Colors.black54
                                          ),
                                      ),
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                                        ),
                                        contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                        hintText: "0"
                                      ),
                                    )
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      height: 10.0,
                      thickness: 3.0,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "มื้อเที่ยง",
                        style: GoogleFonts.prompt(
                          textStyle: const TextStyle(
                              letterSpacing: 0.66,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54
                            )
                        ),
                        textAlign: TextAlign.start,
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ผลวัดระดับน้ำตาลก่อนอาหาร",
                            style: GoogleFonts.prompt(
                              textStyle: const TextStyle(
                                  letterSpacing: 0.66,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                                )
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                            child: TextField( 
                              textAlignVertical: TextAlignVertical.center,
                              style: GoogleFonts.prompt(
                                textStyle: const TextStyle(
                                    letterSpacing: 0.66,
                                    fontSize: 16,
                                    color: Colors.black54
                                  ),
                              ),
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                hintText: "0",
                                suffixIcon: IconButton(
                                  onPressed: null, 
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.blue,
                                    size: 20.0,
                                  )
                                )
                              ),
                            )
                          )
                        ],
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "อาหารที่ทาน",
                            style: GoogleFonts.prompt(
                              textStyle: const TextStyle(
                                  letterSpacing: 0.66,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                                )
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                            child: TextField( 
                              textAlignVertical: TextAlignVertical.center,
                              style: GoogleFonts.prompt(
                                textStyle: const TextStyle(
                                    letterSpacing: 0.66,
                                    fontSize: 16,
                                    color: Colors.black54
                                  ),
                              ),
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                hintText: "เลือกอาหารที่ทาน",
                                suffixIcon: IconButton(
                                  onPressed: null, 
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.blue,
                                    size: 20.0,
                                  )
                                )
                              ),
                            )
                          )
                        ],
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ชนิดแป้งที่ทาน",
                            style: GoogleFonts.prompt(
                              textStyle: const TextStyle(
                                  letterSpacing: 0.66,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                                )
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                            child: TextField( 
                              textAlignVertical: TextAlignVertical.center,
                              style: GoogleFonts.prompt(
                                textStyle: const TextStyle(
                                    letterSpacing: 0.66,
                                    fontSize: 16,
                                    color: Colors.black54
                                  ),
                              ),
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                hintText: "เลือกแป้งที่ทาน"
                              ),
                            )
                          )
                        ],
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "สรุปผลโภชนาการ",
                            style: GoogleFonts.prompt(
                              textStyle: const TextStyle(
                                  letterSpacing: 0.66,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                                )
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "คาร์โบไฮเดรต",
                                    style: GoogleFonts.prompt(
                                      textStyle: const TextStyle(
                                          letterSpacing: 0.66,
                                          fontSize: 16,
                                          color: Colors.black54
                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    width: 100.0,
                                    child: TextField( 
                                      textAlignVertical: TextAlignVertical.center,
                                      style: GoogleFonts.prompt(
                                        textStyle: const TextStyle(
                                            letterSpacing: 0.66,
                                            fontSize: 16,
                                            color: Colors.black54
                                          ),
                                      ),
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                                        ),
                                        contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                        hintText: "0"
                                      ),
                                    )
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "โปรตีน",
                                    style: GoogleFonts.prompt(
                                      textStyle: const TextStyle(
                                          letterSpacing: 0.66,
                                          fontSize: 16,
                                          color: Colors.black54
                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    width: 100.0,
                                    child: TextField( 
                                      textAlignVertical: TextAlignVertical.center,
                                      style: GoogleFonts.prompt(
                                        textStyle: const TextStyle(
                                            letterSpacing: 0.66,
                                            fontSize: 16,
                                            color: Colors.black54
                                          ),
                                      ),
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                                        ),
                                        contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                        hintText: "0"
                                      ),
                                    )
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "คอเรสเตอรอล",
                                    style: GoogleFonts.prompt(
                                      textStyle: const TextStyle(
                                          letterSpacing: 0.66,
                                          fontSize: 16,
                                          color: Colors.black54
                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    width: 100.0,
                                    child: TextField( 
                                      textAlignVertical: TextAlignVertical.center,
                                      style: GoogleFonts.prompt(
                                        textStyle: const TextStyle(
                                            letterSpacing: 0.66,
                                            fontSize: 16,
                                            color: Colors.black54
                                          ),
                                      ),
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                                        ),
                                        contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                        hintText: "0"
                                      ),
                                    )
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      height: 10.0,
                      thickness: 3.0,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "มื้อเย็น",
                        style: GoogleFonts.prompt(
                          textStyle: const TextStyle(
                              letterSpacing: 0.66,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54
                            )
                        ),
                        textAlign: TextAlign.start,
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ผลวัดระดับน้ำตาลก่อนอาหาร",
                            style: GoogleFonts.prompt(
                              textStyle: const TextStyle(
                                  letterSpacing: 0.66,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                                )
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                            child: TextField( 
                              textAlignVertical: TextAlignVertical.center,
                              style: GoogleFonts.prompt(
                                textStyle: const TextStyle(
                                    letterSpacing: 0.66,
                                    fontSize: 16,
                                    color: Colors.black54
                                  ),
                              ),
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                hintText: "0",
                              ),
                            )
                          )
                        ],
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "อาหารที่ทาน",
                            style: GoogleFonts.prompt(
                              textStyle: const TextStyle(
                                  letterSpacing: 0.66,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                                )
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                            child: TextField( 
                              textAlignVertical: TextAlignVertical.center,
                              style: GoogleFonts.prompt(
                                textStyle: const TextStyle(
                                    letterSpacing: 0.66,
                                    fontSize: 16,
                                    color: Colors.black54
                                  ),
                              ),
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                hintText: "เลือกอาหารที่ทาน",
                                suffixIcon: IconButton(
                                  onPressed: null, 
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.blue,
                                    size: 20.0,
                                  )
                                )
                              ),
                            )
                          )
                        ],
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ชนิดแป้งที่ทาน",
                            style: GoogleFonts.prompt(
                              textStyle: const TextStyle(
                                  letterSpacing: 0.66,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                                )
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                            child: TextField( 
                              textAlignVertical: TextAlignVertical.center,
                              style: GoogleFonts.prompt(
                                textStyle: const TextStyle(
                                    letterSpacing: 0.66,
                                    fontSize: 16,
                                    color: Colors.black54
                                  ),
                              ),
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                hintText: "เลือกแป้งที่ทาน",
                                suffixIcon: IconButton(
                                  onPressed: null, 
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.blue,
                                    size: 20.0,
                                  )
                                )
                              ),
                            )
                          )
                        ],
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "สรุปผลโภชนาการ",
                            style: GoogleFonts.prompt(
                              textStyle: const TextStyle(
                                  letterSpacing: 0.66,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                                )
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "คาร์โบไฮเดรต",
                                    style: GoogleFonts.prompt(
                                      textStyle: const TextStyle(
                                          letterSpacing: 0.66,
                                          fontSize: 16,
                                          color: Colors.black54
                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    width: 100.0,
                                    child: TextField( 
                                      textAlignVertical: TextAlignVertical.center,
                                      style: GoogleFonts.prompt(
                                        textStyle: const TextStyle(
                                            letterSpacing: 0.66,
                                            fontSize: 16,
                                            color: Colors.black54
                                          ),
                                      ),
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                                        ),
                                        contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                        hintText: "0"
                                      ),
                                    )
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "โปรตีน",
                                    style: GoogleFonts.prompt(
                                      textStyle: const TextStyle(
                                          letterSpacing: 0.66,
                                          fontSize: 16,
                                          color: Colors.black54
                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    width: 100.0,
                                    child: TextField( 
                                      textAlignVertical: TextAlignVertical.center,
                                      style: GoogleFonts.prompt(
                                        textStyle: const TextStyle(
                                            letterSpacing: 0.66,
                                            fontSize: 16,
                                            color: Colors.black54
                                          ),
                                      ),
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                                        ),
                                        contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                        hintText: "0"
                                      ),
                                    )
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "คอเรสเตอรอล",
                                    style: GoogleFonts.prompt(
                                      textStyle: const TextStyle(
                                          letterSpacing: 0.66,
                                          fontSize: 16,
                                          color: Colors.black54
                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    width: 100.0,
                                    child: TextField( 
                                      textAlignVertical: TextAlignVertical.center,
                                      style: GoogleFonts.prompt(
                                        textStyle: const TextStyle(
                                            letterSpacing: 0.66,
                                            fontSize: 16,
                                            color: Colors.black54
                                          ),
                                      ),
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                                        ),
                                        contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                        hintText: "0"
                                      ),
                                    )
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      height: 10.0,
                      thickness: 3.0,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "มื้อก่อนนอน",
                        style: GoogleFonts.prompt(
                          textStyle: const TextStyle(
                              letterSpacing: 0.66,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54
                            )
                        ),
                        textAlign: TextAlign.start,
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ผลวัดระดับน้ำตาลก่อนอาหาร",
                            style: GoogleFonts.prompt(
                              textStyle: const TextStyle(
                                  letterSpacing: 0.66,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                                )
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                            child: TextField( 
                              textAlignVertical: TextAlignVertical.center,
                              style: GoogleFonts.prompt(
                                textStyle: const TextStyle(
                                    letterSpacing: 0.66,
                                    fontSize: 16,
                                    color: Colors.black54
                                  ),
                              ),
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                hintText: "0"
                              ),
                            )
                          )
                        ],
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "อาหารที่ทาน",
                            style: GoogleFonts.prompt(
                              textStyle: const TextStyle(
                                  letterSpacing: 0.66,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                                )
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                            child: TextField( 
                              textAlignVertical: TextAlignVertical.center,
                              style: GoogleFonts.prompt(
                                textStyle: const TextStyle(
                                    letterSpacing: 0.66,
                                    fontSize: 16,
                                    color: Colors.black54
                                  ),
                              ),
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                hintText: "เลือกอาหารที่ทาน",
                                suffixIcon: IconButton(
                                  onPressed: null, 
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.blue,
                                    size: 20.0,
                                  )
                                )
                              ),
                            )
                          )
                        ],
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ชนิดแป้งที่ทาน",
                            style: GoogleFonts.prompt(
                              textStyle: const TextStyle(
                                  letterSpacing: 0.66,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                                )
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                            child: TextField( 
                              textAlignVertical: TextAlignVertical.center,
                              style: GoogleFonts.prompt(
                                textStyle: const TextStyle(
                                    letterSpacing: 0.66,
                                    fontSize: 16,
                                    color: Colors.black54
                                  ),
                              ),
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                hintText: "เลือกแป้งที่ทาน",
                                suffixIcon: IconButton(
                                  onPressed: null, 
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.blue,
                                    size: 20.0,
                                  )
                                )
                              ),
                            )
                          )
                        ],
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "สรุปผลโภชนาการ",
                            style: GoogleFonts.prompt(
                              textStyle: const TextStyle(
                                  letterSpacing: 0.66,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                                )
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "คาร์โบไฮเดรต",
                                    style: GoogleFonts.prompt(
                                      textStyle: const TextStyle(
                                          letterSpacing: 0.66,
                                          fontSize: 16,
                                          color: Colors.black54
                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    width: 100.0,
                                    child: TextField( 
                                      textAlignVertical: TextAlignVertical.center,
                                      style: GoogleFonts.prompt(
                                        textStyle: const TextStyle(
                                            letterSpacing: 0.66,
                                            fontSize: 16,
                                            color: Colors.black54
                                          ),
                                      ),
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                                        ),
                                        contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                        hintText: "0"
                                      ),
                                    )
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "โปรตีน",
                                    style: GoogleFonts.prompt(
                                      textStyle: const TextStyle(
                                          letterSpacing: 0.66,
                                          fontSize: 16,
                                          color: Colors.black54
                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    width: 100.0,
                                    child: TextField( 
                                      textAlignVertical: TextAlignVertical.center,
                                      style: GoogleFonts.prompt(
                                        textStyle: const TextStyle(
                                            letterSpacing: 0.66,
                                            fontSize: 16,
                                            color: Colors.black54
                                          ),
                                      ),
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                                        ),
                                        contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                        hintText: "0"
                                      ),
                                    )
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "คอเรสเตอรอล",
                                    style: GoogleFonts.prompt(
                                      textStyle: const TextStyle(
                                          letterSpacing: 0.66,
                                          fontSize: 16,
                                          color: Colors.black54
                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    width: 100.0,
                                    child: TextField( 
                                      textAlignVertical: TextAlignVertical.center,
                                      style: GoogleFonts.prompt(
                                        textStyle: const TextStyle(
                                            letterSpacing: 0.66,
                                            fontSize: 16,
                                            color: Colors.black54
                                          ),
                                      ),
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                                        ),
                                        contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                        hintText: "0"
                                      ),
                                    )
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ),
                    const SizedBox(height: 50),
                  ],
                )
              )
            )
          )
        ],
      )
    );
  }
}
