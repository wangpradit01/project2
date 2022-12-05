import 'package:baowan/Data/FoodList.dart';
import 'package:baowan/Provider/HistoryProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HistoryDetail extends StatefulWidget {
  final dynamic historyData;
  const HistoryDetail({Key? key, @required this.historyData}) : super(key: key);

  @override
  State<HistoryDetail> createState() => _HistoryDetailState();
}

class _HistoryDetailState extends State<HistoryDetail> {
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    intialAction();
    super.initState();
  }

  intialAction() {
    final HistoryProvider provider =
        Provider.of<HistoryProvider>(context, listen: false);
    provider.setData(widget.historyData);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color(0xff3B81FF),
        leading: Consumer<HistoryProvider>(
          builder: (BuildContext context, value, Widget? child) =>
              GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              value.reset();
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          "ประวัติการบริโภค",
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
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          DateFormat('วันที่ dd/MM/yyyy').format(
                              DateTime.parse(widget.historyData['created_at'])),
                          style: GoogleFonts.prompt(
                              textStyle: const TextStyle(
                                  letterSpacing: 0.66,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue)),
                        ),
                      ),
                    )),
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
                                        color: Colors.black54)),
                                textAlign: TextAlign.start,
                              )),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
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
                                            color: Colors.black)),
                                  ),
                                  SizedBox(
                                      height: 40.0,
                                      child: Consumer<HistoryProvider>(
                                        builder: (BuildContext context, value,
                                                Widget? child) =>
                                            TextFormField(
                                          initialValue: value.bsBreakfast,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          style: GoogleFonts.prompt(
                                            textStyle: const TextStyle(
                                                letterSpacing: 0.66,
                                                fontSize: 16,
                                                color: Colors.black54),
                                          ),
                                          readOnly: true,
                                          decoration: const InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0))),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              hintText: "0"),
                                        ),
                                      ))
                                ],
                              )),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: Consumer<HistoryProvider>(
                                builder: (BuildContext context, historyProvider,
                                        Widget? child) =>
                                    Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "อาหารที่ทาน",
                                            style: GoogleFonts.prompt(
                                                textStyle: const TextStyle(
                                                    letterSpacing: 0.66,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: double.maxFinite,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Wrap(
                                        spacing: 10,
                                        runSpacing: 10,
                                        direction: Axis.horizontal,
                                        clipBehavior: Clip.hardEdge,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: historyProvider.breakfast,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            child: Consumer<HistoryProvider>(
                              builder: (BuildContext context, historyProvider,
                                      Widget? child) =>
                                  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "ชนิดแป้งที่ทาน",
                                          style: GoogleFonts.prompt(
                                              textStyle: const TextStyle(
                                                  letterSpacing: 0.66,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: double.maxFinite,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      direction: Axis.horizontal,
                                      clipBehavior: Clip.hardEdge,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: historyProvider.breakfastCarbs,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Consumer<HistoryProvider>(
                            builder: (BuildContext context, value,
                                    Widget? child) =>
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "สรุปผลโภชนาการ",
                                          style: GoogleFonts.prompt(
                                              textStyle: const TextStyle(
                                                  letterSpacing: 0.66,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black)),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "คาร์โบไฮเดรต",
                                                    style: GoogleFonts.prompt(
                                                        textStyle:
                                                            const TextStyle(
                                                                letterSpacing:
                                                                    0.66,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black54)),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8,
                                                        horizontal: 12),
                                                    width: double.maxFinite,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color:
                                                                Colors.blue)),
                                                    child: Text(
                                                      value.breakfastNutrients!
                                                          .totalProtein
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "โปรตีน",
                                                    style: GoogleFonts.prompt(
                                                        textStyle:
                                                            const TextStyle(
                                                                letterSpacing:
                                                                    0.66,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black54)),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8,
                                                        horizontal: 12),
                                                    width: double.maxFinite,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color:
                                                                Colors.blue)),
                                                    child: Text(
                                                      value.breakfastNutrients!
                                                          .totalProtein
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "คอเรสเตอรอล",
                                                    style: GoogleFonts.prompt(
                                                        textStyle:
                                                            const TextStyle(
                                                                letterSpacing:
                                                                    0.66,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black54)),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8,
                                                        horizontal: 12),
                                                    width: double.maxFinite,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color:
                                                                Colors.blue)),
                                                    child: Text(
                                                      value.breakfastNutrients!
                                                          .totalCalories
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )),
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
                                        color: Colors.black54)),
                                textAlign: TextAlign.start,
                              )),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
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
                                            color: Colors.black)),
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    child: Consumer<HistoryProvider>(
                                      builder: (BuildContext context, value,
                                              Widget? child) =>
                                          TextFormField(
                                        initialValue: value.bsLunch,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        readOnly: true,
                                        style: GoogleFonts.prompt(
                                          textStyle: const TextStyle(
                                              letterSpacing: 0.66,
                                              fontSize: 16,
                                              color: Colors.black54),
                                        ),
                                        decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
                                          contentPadding: EdgeInsets.fromLTRB(
                                              10.0, 0.0, 10.0, 0.0),
                                          hintText: "0",
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: Consumer<HistoryProvider>(
                                builder: (BuildContext context, historyProvider,
                                        Widget? child) =>
                                    Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "อาหารที่ทาน",
                                            style: GoogleFonts.prompt(
                                                textStyle: const TextStyle(
                                                    letterSpacing: 0.66,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                        width: double.maxFinite,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Wrap(
                                          spacing: 10,
                                          runSpacing: 10,
                                          direction: Axis.horizontal,
                                          clipBehavior: Clip.hardEdge,
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: historyProvider.lunch,
                                        ))
                                  ],
                                ),
                              )),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            child: Consumer<HistoryProvider>(
                              builder: (BuildContext context, historyProvider,
                                      Widget? child) =>
                                  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "ชนิดแป้งที่ทาน",
                                          style: GoogleFonts.prompt(
                                              textStyle: const TextStyle(
                                                  letterSpacing: 0.66,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: double.maxFinite,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      direction: Axis.horizontal,
                                      clipBehavior: Clip.hardEdge,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: historyProvider.lunchCarbs,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Consumer<HistoryProvider>(
                            builder: (BuildContext context, value,
                                    Widget? child) =>
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "สรุปผลโภชนาการ",
                                          style: GoogleFonts.prompt(
                                              textStyle: const TextStyle(
                                                  letterSpacing: 0.66,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black)),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "คาร์โบไฮเดรต",
                                                    style: GoogleFonts.prompt(
                                                        textStyle:
                                                            const TextStyle(
                                                                letterSpacing:
                                                                    0.66,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black54)),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8,
                                                        horizontal: 12),
                                                    width: double.maxFinite,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color:
                                                                Colors.blue)),
                                                    child: Text(
                                                      value.lunchNutrients!
                                                          .totalProtein
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "โปรตีน",
                                                    style: GoogleFonts.prompt(
                                                        textStyle:
                                                            const TextStyle(
                                                                letterSpacing:
                                                                    0.66,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black54)),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8,
                                                        horizontal: 12),
                                                    width: double.maxFinite,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color:
                                                                Colors.blue)),
                                                    child: Text(
                                                      value.lunchNutrients!
                                                          .totalProtein
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "คอเรสเตอรอล",
                                                    style: GoogleFonts.prompt(
                                                        textStyle:
                                                            const TextStyle(
                                                                letterSpacing:
                                                                    0.66,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black54)),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8,
                                                        horizontal: 12),
                                                    width: double.maxFinite,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color:
                                                                Colors.blue)),
                                                    child: Text(
                                                      value.lunchNutrients!
                                                          .totalCalories
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )),
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
                                        color: Colors.black54)),
                                textAlign: TextAlign.start,
                              )),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
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
                                            color: Colors.black)),
                                  ),
                                  SizedBox(
                                      height: 40.0,
                                      child: Consumer<HistoryProvider>(
                                        builder: (BuildContext context, value,
                                                Widget? child) =>
                                            TextFormField(
                                          initialValue: value.bsDinner,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          readOnly: true,
                                          style: GoogleFonts.prompt(
                                            textStyle: const TextStyle(
                                                letterSpacing: 0.66,
                                                fontSize: 16,
                                                color: Colors.black54),
                                          ),
                                          decoration: const InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0))),
                                            contentPadding: EdgeInsets.fromLTRB(
                                                10.0, 0.0, 10.0, 0.0),
                                            hintText: "0",
                                          ),
                                        ),
                                      ))
                                ],
                              )),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: Consumer<HistoryProvider>(
                                builder: (BuildContext context, historyProvider,
                                        Widget? child) =>
                                    Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "อาหารที่ทาน",
                                            style: GoogleFonts.prompt(
                                                textStyle: const TextStyle(
                                                    letterSpacing: 0.66,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: double.maxFinite,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Wrap(
                                        spacing: 10,
                                        runSpacing: 10,
                                        direction: Axis.horizontal,
                                        clipBehavior: Clip.hardEdge,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: historyProvider.dinner,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            child: Consumer<HistoryProvider>(
                              builder: (BuildContext context, historyProvider,
                                      Widget? child) =>
                                  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "ชนิดแป้งที่ทาน",
                                          style: GoogleFonts.prompt(
                                              textStyle: const TextStyle(
                                                  letterSpacing: 0.66,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: double.maxFinite,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      direction: Axis.horizontal,
                                      clipBehavior: Clip.hardEdge,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: historyProvider.dinnerCarbs,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Consumer<HistoryProvider>(
                            builder: (BuildContext context, value,
                                    Widget? child) =>
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "สรุปผลโภชนาการ",
                                          style: GoogleFonts.prompt(
                                              textStyle: const TextStyle(
                                                  letterSpacing: 0.66,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black)),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "คาร์โบไฮเดรต",
                                                    style: GoogleFonts.prompt(
                                                        textStyle:
                                                            const TextStyle(
                                                                letterSpacing:
                                                                    0.66,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black54)),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8,
                                                        horizontal: 12),
                                                    width: double.maxFinite,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color:
                                                                Colors.blue)),
                                                    child: Text(
                                                      value.dinnerNutrients!
                                                          .totalProtein
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "โปรตีน",
                                                    style: GoogleFonts.prompt(
                                                        textStyle:
                                                            const TextStyle(
                                                                letterSpacing:
                                                                    0.66,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black54)),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8,
                                                        horizontal: 12),
                                                    width: double.maxFinite,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color:
                                                                Colors.blue)),
                                                    child: Text(
                                                      value.dinnerNutrients!
                                                          .totalProtein
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "คอเรสเตอรอล",
                                                    style: GoogleFonts.prompt(
                                                        textStyle:
                                                            const TextStyle(
                                                                letterSpacing:
                                                                    0.66,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black54)),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8,
                                                        horizontal: 12),
                                                    width: double.maxFinite,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color:
                                                                Colors.blue)),
                                                    child: Text(
                                                      value.dinnerNutrients!
                                                          .totalCalories
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )),
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
                                        color: Colors.black54)),
                                textAlign: TextAlign.start,
                              )),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
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
                                            color: Colors.black)),
                                  ),
                                  SizedBox(
                                      height: 40.0,
                                      child: Consumer<HistoryProvider>(
                                        builder: (BuildContext context, value,
                                                Widget? child) =>
                                            TextFormField(
                                          initialValue: value.bsBeforeBed,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          readOnly: true,
                                          style: GoogleFonts.prompt(
                                            textStyle: const TextStyle(
                                                letterSpacing: 0.66,
                                                fontSize: 16,
                                                color: Colors.black54),
                                          ),
                                          decoration: const InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0))),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              hintText: "0"),
                                        ),
                                      ))
                                ],
                              )),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: Consumer<HistoryProvider>(
                                builder: (BuildContext context, historyProvider,
                                        Widget? child) =>
                                    Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "อาหารที่ทาน",
                                            style: GoogleFonts.prompt(
                                                textStyle: const TextStyle(
                                                    letterSpacing: 0.66,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: double.maxFinite,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Wrap(
                                        spacing: 10,
                                        runSpacing: 10,
                                        direction: Axis.horizontal,
                                        clipBehavior: Clip.hardEdge,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: historyProvider.beforeBed,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            child: Consumer<HistoryProvider>(
                              builder: (BuildContext context, historyProvider,
                                      Widget? child) =>
                                  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "ชนิดแป้งที่ทาน",
                                          style: GoogleFonts.prompt(
                                              textStyle: const TextStyle(
                                                  letterSpacing: 0.66,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: double.maxFinite,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      direction: Axis.horizontal,
                                      clipBehavior: Clip.hardEdge,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: historyProvider.beforeBedCarbs,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Consumer<HistoryProvider>(
                            builder: (BuildContext context, value,
                                    Widget? child) =>
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "สรุปผลโภชนาการ",
                                          style: GoogleFonts.prompt(
                                              textStyle: const TextStyle(
                                                  letterSpacing: 0.66,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black)),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "คาร์โบไฮเดรต",
                                                    style: GoogleFonts.prompt(
                                                        textStyle:
                                                            const TextStyle(
                                                                letterSpacing:
                                                                    0.66,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black54)),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8,
                                                        horizontal: 12),
                                                    width: double.maxFinite,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color:
                                                                Colors.blue)),
                                                    child: Text(
                                                      value.beforeBedNutrients!
                                                          .totalProtein
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "โปรตีน",
                                                    style: GoogleFonts.prompt(
                                                        textStyle:
                                                            const TextStyle(
                                                                letterSpacing:
                                                                    0.66,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black54)),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8,
                                                        horizontal: 12),
                                                    width: double.maxFinite,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color:
                                                                Colors.blue)),
                                                    child: Text(
                                                      value.beforeBedNutrients!
                                                          .totalProtein
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "คอเรสเตอรอล",
                                                    style: GoogleFonts.prompt(
                                                        textStyle:
                                                            const TextStyle(
                                                                letterSpacing:
                                                                    0.66,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black54)),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8,
                                                        horizontal: 12),
                                                    width: double.maxFinite,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color:
                                                                Colors.blue)),
                                                    child: Text(
                                                      value.beforeBedNutrients!
                                                          .totalCalories
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )),
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
