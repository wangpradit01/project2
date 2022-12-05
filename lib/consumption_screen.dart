import 'package:baowan/Data/FoodList.dart';
import 'package:baowan/Provider/FoodProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ConsumtionScreen extends StatefulWidget {
  const ConsumtionScreen({Key? key}) : super(key: key);

  @override
  State<ConsumtionScreen> createState() => _ConsumtionScreenState();
}

class _ConsumtionScreenState extends State<ConsumtionScreen> {
  VoidCallback? onDelete() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color(0xff3B81FF),
        leading: Consumer<FoodProvider>(
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
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    DateFormat('วันที่ dd/MM/yyyy').format(DateTime.now()),
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
                                child: Consumer<FoodProvider>(
                                  builder: (BuildContext context, value,
                                          Widget? child) =>
                                      TextField(
                                    textAlignVertical: TextAlignVertical.center,
                                    onChanged: (text) {
                                      value.setBloodSugar(1, text);
                                    },
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
                                        hintText: "0"),
                                  ),
                                ))
                          ],
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Consumer<FoodProvider>(
                          builder: (BuildContext context, foodProvider,
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
                                  GestureDetector(
                                    onTap: () async {
                                      await showModalBottomSheet<void>(
                                        isScrollControlled: true,
                                        isDismissible: false,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Consumer<FoodProvider>(
                                            builder: (BuildContext context,
                                                    value, Widget? child) =>
                                                Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.horizontal(
                                                          left: Radius.circular(
                                                              15),
                                                          right:
                                                              Radius.circular(
                                                                  15))),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20,
                                                      horizontal: 20),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.8,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: double.maxFinite,
                                                    child: Stack(
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "เลือกอาหารที่ทาน",
                                                            style: GoogleFonts.prompt(
                                                                textStyle: const TextStyle(
                                                                    letterSpacing:
                                                                        0.66,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Colors
                                                                        .black)),
                                                          ),
                                                        ),
                                                        Positioned.fill(
                                                            child: Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              foodProvider
                                                                  .calFood(1);
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Icon(
                                                                Icons.close),
                                                          ),
                                                        ))
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Expanded(
                                                    child: ListView.separated(
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return Row(
                                                          children: [
                                                            Checkbox(
                                                                value: value
                                                                        .breakfastSelected[
                                                                    index],
                                                                onChanged:
                                                                    (isChecked) {
                                                                  value.selectedBreakfast(
                                                                      index);
                                                                }),
                                                            Text(
                                                              foods[index]
                                                                  ["food_name"],
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: value.breakfastSelected[
                                                                            index] ==
                                                                        true
                                                                    ? Colors
                                                                        .blue
                                                                    : Color(
                                                                        0xff808080),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                      itemCount: foods.length,
                                                      separatorBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return Divider();
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                      foodProvider.breakfast = [];
                                      setState(() {
                                        for (int i = 0;
                                            i <
                                                foodProvider
                                                    .breakfastSelected.length;
                                            i++) {
                                          if (foodProvider
                                                  .breakfastSelected[i] ==
                                              true) {
                                            foodProvider.breakfast.add(FoodChip(
                                                name: foods[i]['food_name']));
                                          }
                                        }
                                      });
                                    },
                                    behavior: HitTestBehavior.translucent,
                                    child: Text(
                                      "แก้ไข",
                                      style: GoogleFonts.prompt(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.blue)),
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
                                child: foodProvider.breakfast.length != 0
                                    ? Wrap(
                                        spacing: 10,
                                        runSpacing: 10,
                                        direction: Axis.horizontal,
                                        clipBehavior: Clip.hardEdge,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: foodProvider.breakfast,
                                      )
                                    : Container(
                                        height: 20,
                                        child: GestureDetector(
                                          onTap: () async {
                                            await showModalBottomSheet<void>(
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius
                                                              .horizontal(
                                                                  left: Radius
                                                                      .circular(
                                                                          15),
                                                                  right: Radius
                                                                      .circular(
                                                                          15))),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 20,
                                                      horizontal: 20),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.8,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width: double.maxFinite,
                                                        child: Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                "เลือกอาหารที่ทาน",
                                                                style: GoogleFonts.prompt(
                                                                    textStyle: const TextStyle(
                                                                        letterSpacing:
                                                                            0.66,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: Colors
                                                                            .black)),
                                                              ),
                                                            ),
                                                            Positioned.fill(
                                                                child: Align(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  foodProvider
                                                                      .calFood(
                                                                          1);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Icon(
                                                                    Icons
                                                                        .close),
                                                              ),
                                                            ))
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Expanded(
                                                        child: Consumer<
                                                            FoodProvider>(
                                                          builder: (BuildContext
                                                                      context,
                                                                  value,
                                                                  Widget?
                                                                      child) =>
                                                              ListView
                                                                  .separated(
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              return Row(
                                                                children: [
                                                                  Checkbox(
                                                                      value: value
                                                                              .breakfastSelected[
                                                                          index],
                                                                      onChanged:
                                                                          (isChecked) {
                                                                        value.selectedBreakfast(
                                                                            index);
                                                                      }),
                                                                  Text(
                                                                    foods[index]
                                                                        [
                                                                        "food_name"],
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: foodProvider.breakfastSelected[index] ==
                                                                              true
                                                                          ? Colors
                                                                              .blue
                                                                          : Color(
                                                                              0xff808080),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                            itemCount:
                                                                foods.length,
                                                            separatorBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              return Divider();
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                            foodProvider.breakfast = [];
                                            setState(() {
                                              for (int i = 0;
                                                  i <
                                                      foodProvider
                                                          .breakfastSelected
                                                          .length;
                                                  i++) {
                                                if (foodProvider
                                                        .breakfastSelected[i] ==
                                                    true) {
                                                  foodProvider.breakfast.add(
                                                      FoodChip(
                                                          name: foods[i]
                                                              ['food_name']));
                                                }
                                              }
                                            });
                                          },
                                          behavior: HitTestBehavior.translucent,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "เลือกอาหารที่ทาน",
                                                  style: GoogleFonts.prompt(
                                                    textStyle: const TextStyle(
                                                        letterSpacing: 0.5,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xff666666)),
                                                  ),
                                                ),
                                              ),
                                              Icon(
                                                Icons.add_circle_outline,
                                                color: Colors.blue,
                                                size: 20.0,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                              )
                            ],
                          ),
                        )),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Consumer<FoodProvider>(
                        builder: (BuildContext context, foodProvider,
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
                                GestureDetector(
                                  onTap: () async {
                                    await showModalBottomSheet<void>(
                                      isScrollControlled: true,
                                      isDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Consumer<FoodProvider>(
                                          builder: (BuildContext context, value,
                                                  Widget? child) =>
                                              Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                        left:
                                                            Radius.circular(15),
                                                        right: Radius.circular(
                                                            15))),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20, horizontal: 20),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.8,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: double.maxFinite,
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "เลือกแป้งที่ทาน",
                                                          style: GoogleFonts.prompt(
                                                              textStyle: const TextStyle(
                                                                  letterSpacing:
                                                                      0.66,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Colors
                                                                      .black)),
                                                        ),
                                                      ),
                                                      Positioned.fill(
                                                          child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            foodProvider
                                                                .calFood(1);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child:
                                                              Icon(Icons.close),
                                                        ),
                                                      ))
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Expanded(
                                                  child: ListView.separated(
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Row(
                                                        children: [
                                                          Checkbox(
                                                              value:
                                                                  value.breakfastCarbsSelected[
                                                                          index]
                                                                      [
                                                                      'selected'],
                                                              onChanged:
                                                                  (isChecked) {
                                                                value
                                                                    .selectedCarbsBreakfast(
                                                                        index);
                                                              }),
                                                          Expanded(
                                                            child: Text(
                                                              carbs[index]
                                                                  ["food_name"],
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: value.breakfastCarbsSelected[index]
                                                                            [
                                                                            'selected'] ==
                                                                        true
                                                                    ? Colors
                                                                        .blue
                                                                    : Color(
                                                                        0xff808080),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 40,
                                                            width: 100,
                                                            child:
                                                                TextFormField(
                                                              initialValue: value
                                                                  .breakfastCarbsSelected[
                                                                      index]
                                                                      ['volume']
                                                                  .toString(),
                                                              enabled:
                                                                  value.breakfastCarbsSelected[
                                                                          index]
                                                                      [
                                                                      'selected'],
                                                              decoration:
                                                                  InputDecoration(
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            8),
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                suffixText:
                                                                    '${carbs[index]['food_detail']}',
                                                              ),
                                                              onChanged:
                                                                  (text) {
                                                                value.breakfastCarbsSelected[
                                                                        index][
                                                                    'volume'] = text;
                                                              },
                                                            ),
                                                          )
                                                        ],
                                                      );
                                                    },
                                                    itemCount: carbs.length,
                                                    separatorBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Divider();
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                    foodProvider.breakfastCarbs = [];
                                    setState(() {
                                      for (int i = 0;
                                          i <
                                              foodProvider
                                                  .breakfastCarbsSelected
                                                  .length;
                                          i++) {
                                        if (foodProvider
                                                    .breakfastCarbsSelected[i]
                                                ['selected'] ==
                                            true) {
                                          foodProvider.breakfastCarbs
                                              .add(CarbsChip(
                                            name: carbs[i]['food_name'],
                                            suffix: carbs[i]['food_detail'],
                                            volume: foodProvider
                                                        .breakfastCarbsSelected[
                                                    i]['volume'] is String
                                                ? foodProvider
                                                        .breakfastCarbsSelected[
                                                    i]['volume']
                                                : foodProvider
                                                    .breakfastCarbsSelected[i]
                                                        ['volume']
                                                    .toString(),
                                          ));
                                        }
                                      }
                                    });
                                  },
                                  behavior: HitTestBehavior.translucent,
                                  child: Text(
                                    "แก้ไข",
                                    style: GoogleFonts.prompt(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue)),
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
                              child: foodProvider.breakfastCarbs.length != 0
                                  ? Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      direction: Axis.horizontal,
                                      clipBehavior: Clip.hardEdge,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: foodProvider.breakfastCarbs,
                                    )
                                  : Container(
                                      height: 20,
                                      child: GestureDetector(
                                        onTap: () async {
                                          await showModalBottomSheet<void>(
                                            isScrollControlled: true,
                                            isDismissible: false,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Consumer<FoodProvider>(
                                                builder: (BuildContext context,
                                                        value, Widget? child) =>
                                                    Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius
                                                              .horizontal(
                                                                  left: Radius
                                                                      .circular(
                                                                          15),
                                                                  right: Radius
                                                                      .circular(
                                                                          15))),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 20,
                                                      horizontal: 20),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.8,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width: double.maxFinite,
                                                        child: Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                "เลือกแป้งที่ทาน",
                                                                style: GoogleFonts.prompt(
                                                                    textStyle: const TextStyle(
                                                                        letterSpacing:
                                                                            0.66,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: Colors
                                                                            .black)),
                                                              ),
                                                            ),
                                                            Positioned.fill(
                                                                child: Align(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  foodProvider
                                                                      .calFood(
                                                                          1);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Icon(
                                                                    Icons
                                                                        .close),
                                                              ),
                                                            ))
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Expanded(
                                                        child:
                                                            ListView.separated(
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return Row(
                                                              children: [
                                                                Checkbox(
                                                                    value: value
                                                                            .breakfastCarbsSelected[index]
                                                                        [
                                                                        'selected'],
                                                                    onChanged:
                                                                        (isChecked) {
                                                                      value.selectedCarbsBreakfast(
                                                                          index);
                                                                    }),
                                                                Expanded(
                                                                  child: Text(
                                                                    carbs[index]
                                                                        [
                                                                        "food_name"],
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: value.breakfastCarbsSelected[index]['selected'] ==
                                                                              true
                                                                          ? Colors
                                                                              .blue
                                                                          : Color(
                                                                              0xff808080),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height: 40,
                                                                  width: 100,
                                                                  child:
                                                                      TextFormField(
                                                                    initialValue: value
                                                                        .breakfastCarbsSelected[
                                                                            index]
                                                                            [
                                                                            'volume']
                                                                        .toString(),
                                                                    enabled: value
                                                                            .breakfastCarbsSelected[index]
                                                                        [
                                                                        'selected'],
                                                                    decoration:
                                                                        InputDecoration(
                                                                      contentPadding: const EdgeInsets
                                                                              .symmetric(
                                                                          horizontal:
                                                                              8),
                                                                      border: OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10)),
                                                                      suffixText:
                                                                          '${carbs[index]['food_detail']}',
                                                                    ),
                                                                    onChanged:
                                                                        (text) {
                                                                      value.breakfastCarbsSelected[index]
                                                                              [
                                                                              'volume'] =
                                                                          text;
                                                                    },
                                                                  ),
                                                                )
                                                              ],
                                                            );
                                                          },
                                                          itemCount:
                                                              carbs.length,
                                                          separatorBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return Divider();
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                          foodProvider.breakfastCarbs = [];
                                          setState(() {
                                            for (int i = 0;
                                                i <
                                                    foodProvider
                                                        .breakfastCarbsSelected
                                                        .length;
                                                i++) {
                                              if (foodProvider
                                                          .breakfastCarbsSelected[
                                                      i]['selected'] ==
                                                  true) {
                                                foodProvider.breakfastCarbs
                                                    .add(CarbsChip(
                                                  name: carbs[i]['food_name'],
                                                  suffix: carbs[i]
                                                      ['food_detail'],
                                                  volume: foodProvider
                                                              .breakfastCarbsSelected[
                                                          i]['volume'] is String
                                                      ? foodProvider
                                                              .breakfastCarbsSelected[
                                                          i]['volume']
                                                      : foodProvider
                                                          .breakfastCarbsSelected[
                                                              i]['volume']
                                                          .toString(),
                                                ));
                                              }
                                            }
                                          });
                                        },
                                        behavior: HitTestBehavior.translucent,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "เลือกแป้งที่ทาน",
                                                style: GoogleFonts.prompt(
                                                  textStyle: const TextStyle(
                                                      letterSpacing: 0.5,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xff666666)),
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.add_circle_outline,
                                              color: Colors.blue,
                                              size: 20.0,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Consumer<FoodProvider>(
                      builder: (BuildContext context, value, Widget? child) =>
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
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
                                                  textStyle: const TextStyle(
                                                      letterSpacing: 0.66,
                                                      fontSize: 16,
                                                      color: Colors.black54)),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 12),
                                              width: double.maxFinite,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.blue)),
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
                                                  textStyle: const TextStyle(
                                                      letterSpacing: 0.66,
                                                      fontSize: 16,
                                                      color: Colors.black54)),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 12),
                                              width: double.maxFinite,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.blue)),
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
                                                  textStyle: const TextStyle(
                                                      letterSpacing: 0.66,
                                                      fontSize: 16,
                                                      color: Colors.black54)),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 12),
                                              width: double.maxFinite,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.blue)),
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
                                child: Consumer<FoodProvider>(
                                  builder: (BuildContext context, value,
                                          Widget? child) =>
                                      TextField(
                                    textAlignVertical: TextAlignVertical.center,
                                    onChanged: (text) {
                                      value.setBloodSugar(2, text);
                                    },
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
                        child: Consumer<FoodProvider>(
                          builder: (BuildContext context, foodProvider,
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
                                  GestureDetector(
                                    onTap: () async {
                                      await showModalBottomSheet<void>(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Consumer<FoodProvider>(
                                            builder: (BuildContext context,
                                                    value, Widget? child) =>
                                                Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.horizontal(
                                                          left: Radius.circular(
                                                              15),
                                                          right:
                                                              Radius.circular(
                                                                  15))),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20,
                                                      horizontal: 20),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.8,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: double.maxFinite,
                                                    child: Stack(
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "เลือกอาหารที่ทาน",
                                                            style: GoogleFonts.prompt(
                                                                textStyle: const TextStyle(
                                                                    letterSpacing:
                                                                        0.66,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Colors
                                                                        .black)),
                                                          ),
                                                        ),
                                                        Positioned.fill(
                                                            child: Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              foodProvider
                                                                  .calFood(2);
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Icon(
                                                                Icons.close),
                                                          ),
                                                        ))
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Expanded(
                                                    child: ListView.separated(
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return Row(
                                                          children: [
                                                            Checkbox(
                                                                value: value
                                                                        .lunchSelected[
                                                                    index],
                                                                onChanged:
                                                                    (isChecked) {
                                                                  value.selectedLunch(
                                                                      index);
                                                                }),
                                                            Text(
                                                              foods[index]
                                                                  ["food_name"],
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: value.lunchSelected[
                                                                            index] ==
                                                                        true
                                                                    ? Colors
                                                                        .blue
                                                                    : Color(
                                                                        0xff808080),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                      itemCount: foods.length,
                                                      separatorBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return Divider();
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                      foodProvider.lunch = [];
                                      setState(() {
                                        for (int i = 0;
                                            i <
                                                foodProvider
                                                    .lunchSelected.length;
                                            i++) {
                                          if (foodProvider.lunchSelected[i] ==
                                              true) {
                                            foodProvider.lunch.add(FoodChip(
                                                name: foods[i]['food_name']));
                                          }
                                        }
                                      });
                                    },
                                    behavior: HitTestBehavior.translucent,
                                    child: Text(
                                      "แก้ไข",
                                      style: GoogleFonts.prompt(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.blue)),
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
                                child: foodProvider.lunch.length != 0
                                    ? Wrap(
                                        spacing: 10,
                                        runSpacing: 10,
                                        direction: Axis.horizontal,
                                        clipBehavior: Clip.hardEdge,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: foodProvider.lunch,
                                      )
                                    : Container(
                                        height: 20,
                                        child: GestureDetector(
                                          onTap: () async {
                                            await showModalBottomSheet<void>(
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius
                                                              .horizontal(
                                                                  left: Radius
                                                                      .circular(
                                                                          15),
                                                                  right: Radius
                                                                      .circular(
                                                                          15))),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 20,
                                                      horizontal: 20),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.8,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width: double.maxFinite,
                                                        child: Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                "เลือกอาหารที่ทาน",
                                                                style: GoogleFonts.prompt(
                                                                    textStyle: const TextStyle(
                                                                        letterSpacing:
                                                                            0.66,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: Colors
                                                                            .black)),
                                                              ),
                                                            ),
                                                            Positioned.fill(
                                                                child: Align(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  foodProvider
                                                                      .calFood(
                                                                          2);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Icon(
                                                                    Icons
                                                                        .close),
                                                              ),
                                                            ))
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Expanded(
                                                        child: Consumer<
                                                            FoodProvider>(
                                                          builder: (BuildContext
                                                                      context,
                                                                  value,
                                                                  Widget?
                                                                      child) =>
                                                              ListView
                                                                  .separated(
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              return Row(
                                                                children: [
                                                                  Checkbox(
                                                                      value: value
                                                                              .lunchSelected[
                                                                          index],
                                                                      onChanged:
                                                                          (isChecked) {
                                                                        value.selectedLunch(
                                                                            index);
                                                                      }),
                                                                  Text(
                                                                    foods[index]
                                                                        [
                                                                        "food_name"],
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: foodProvider.lunchSelected[index] ==
                                                                              true
                                                                          ? Colors
                                                                              .blue
                                                                          : Color(
                                                                              0xff808080),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                            itemCount:
                                                                foods.length,
                                                            separatorBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              return Divider();
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                            foodProvider.lunch = [];
                                            setState(() {
                                              for (int i = 0;
                                                  i <
                                                      foodProvider
                                                          .lunchSelected.length;
                                                  i++) {
                                                if (foodProvider
                                                        .breakfastSelected[i] ==
                                                    true) {
                                                  foodProvider.lunch.add(
                                                      FoodChip(
                                                          name: foods[i]
                                                              ['food_name']));
                                                }
                                              }
                                            });
                                          },
                                          behavior: HitTestBehavior.translucent,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "เลือกอาหารที่ทาน",
                                                  style: GoogleFonts.prompt(
                                                    textStyle: const TextStyle(
                                                        letterSpacing: 0.5,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xff666666)),
                                                  ),
                                                ),
                                              ),
                                              Icon(
                                                Icons.add_circle_outline,
                                                color: Colors.blue,
                                                size: 20.0,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                              )
                            ],
                          ),
                        )),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Consumer<FoodProvider>(
                        builder: (BuildContext context, foodProvider,
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
                                GestureDetector(
                                  onTap: () async {
                                    await showModalBottomSheet<void>(
                                      isScrollControlled: true,
                                      isDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Consumer<FoodProvider>(
                                          builder: (BuildContext context, value,
                                                  Widget? child) =>
                                              Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                        left:
                                                            Radius.circular(15),
                                                        right: Radius.circular(
                                                            15))),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20, horizontal: 20),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.8,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: double.maxFinite,
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "เลือกแป้งที่ทาน",
                                                          style: GoogleFonts.prompt(
                                                              textStyle: const TextStyle(
                                                                  letterSpacing:
                                                                      0.66,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Colors
                                                                      .black)),
                                                        ),
                                                      ),
                                                      Positioned.fill(
                                                          child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            foodProvider
                                                                .calFood(2);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child:
                                                              Icon(Icons.close),
                                                        ),
                                                      ))
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Expanded(
                                                  child: ListView.separated(
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Row(
                                                        children: [
                                                          Checkbox(
                                                              value:
                                                                  value.lunchCarbsSelected[
                                                                          index]
                                                                      [
                                                                      'selected'],
                                                              onChanged:
                                                                  (isChecked) {
                                                                value
                                                                    .selectedCarbsLunch(
                                                                        index);
                                                              }),
                                                          Expanded(
                                                            child: Text(
                                                              carbs[index]
                                                                  ["food_name"],
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: value.lunchCarbsSelected[index]
                                                                            [
                                                                            'selected'] ==
                                                                        true
                                                                    ? Colors
                                                                        .blue
                                                                    : Color(
                                                                        0xff808080),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 40,
                                                            width: 100,
                                                            child:
                                                                TextFormField(
                                                              initialValue: value
                                                                  .lunchCarbsSelected[
                                                                      index]
                                                                      ['volume']
                                                                  .toString(),
                                                              enabled:
                                                                  value.lunchCarbsSelected[
                                                                          index]
                                                                      [
                                                                      'selected'],
                                                              decoration:
                                                                  InputDecoration(
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            8),
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                suffixText:
                                                                    '${carbs[index]['food_detail']}',
                                                              ),
                                                              onChanged:
                                                                  (text) {
                                                                value.lunchCarbsSelected[
                                                                        index][
                                                                    'volume'] = text;
                                                              },
                                                            ),
                                                          )
                                                        ],
                                                      );
                                                    },
                                                    itemCount: carbs.length,
                                                    separatorBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Divider();
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                    foodProvider.lunchCarbs = [];
                                    setState(() {
                                      for (int i = 0;
                                          i <
                                              foodProvider
                                                  .lunchCarbsSelected.length;
                                          i++) {
                                        if (foodProvider.lunchCarbsSelected[i]
                                                ['selected'] ==
                                            true) {
                                          foodProvider.lunchCarbs.add(CarbsChip(
                                            name: carbs[i]['food_name'],
                                            suffix: carbs[i]['food_detail'],
                                            volume: foodProvider
                                                        .lunchCarbsSelected[i]
                                                    ['volume'] is String
                                                ? foodProvider
                                                        .lunchCarbsSelected[i]
                                                    ['volume']
                                                : foodProvider
                                                    .lunchCarbsSelected[i]
                                                        ['volume']
                                                    .toString(),
                                          ));
                                        }
                                      }
                                    });
                                  },
                                  behavior: HitTestBehavior.translucent,
                                  child: Text(
                                    "แก้ไข",
                                    style: GoogleFonts.prompt(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue)),
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
                              child: foodProvider.lunchCarbs.length != 0
                                  ? Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      direction: Axis.horizontal,
                                      clipBehavior: Clip.hardEdge,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: foodProvider.lunchCarbs,
                                    )
                                  : Container(
                                      height: 20,
                                      child: GestureDetector(
                                        onTap: () async {
                                          await showModalBottomSheet<void>(
                                            isScrollControlled: true,
                                            isDismissible: false,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Consumer<FoodProvider>(
                                                builder: (BuildContext context,
                                                        value, Widget? child) =>
                                                    Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius
                                                              .horizontal(
                                                                  left: Radius
                                                                      .circular(
                                                                          15),
                                                                  right: Radius
                                                                      .circular(
                                                                          15))),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 20,
                                                      horizontal: 20),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.8,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width: double.maxFinite,
                                                        child: Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                "เลือกแป้งที่ทาน",
                                                                style: GoogleFonts.prompt(
                                                                    textStyle: const TextStyle(
                                                                        letterSpacing:
                                                                            0.66,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: Colors
                                                                            .black)),
                                                              ),
                                                            ),
                                                            Positioned.fill(
                                                                child: Align(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  foodProvider
                                                                      .calFood(
                                                                          2);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Icon(
                                                                    Icons
                                                                        .close),
                                                              ),
                                                            ))
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Expanded(
                                                        child:
                                                            ListView.separated(
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return Row(
                                                              children: [
                                                                Checkbox(
                                                                    value: value
                                                                            .lunchCarbsSelected[index]
                                                                        [
                                                                        'selected'],
                                                                    onChanged:
                                                                        (isChecked) {
                                                                      value.selectedCarbsLunch(
                                                                          index);
                                                                    }),
                                                                Expanded(
                                                                  child: Text(
                                                                    carbs[index]
                                                                        [
                                                                        "food_name"],
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: value.lunchCarbsSelected[index]['selected'] ==
                                                                              true
                                                                          ? Colors
                                                                              .blue
                                                                          : Color(
                                                                              0xff808080),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height: 40,
                                                                  width: 100,
                                                                  child:
                                                                      TextFormField(
                                                                    initialValue: value
                                                                        .lunchCarbsSelected[
                                                                            index]
                                                                            [
                                                                            'volume']
                                                                        .toString(),
                                                                    enabled: value
                                                                            .lunchCarbsSelected[index]
                                                                        [
                                                                        'selected'],
                                                                    decoration:
                                                                        InputDecoration(
                                                                      contentPadding: const EdgeInsets
                                                                              .symmetric(
                                                                          horizontal:
                                                                              8),
                                                                      border: OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10)),
                                                                      suffixText:
                                                                          '${carbs[index]['food_detail']}',
                                                                    ),
                                                                    onChanged:
                                                                        (text) {
                                                                      value.lunchCarbsSelected[index]
                                                                              [
                                                                              'volume'] =
                                                                          text;
                                                                    },
                                                                  ),
                                                                )
                                                              ],
                                                            );
                                                          },
                                                          itemCount:
                                                              carbs.length,
                                                          separatorBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return Divider();
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                          foodProvider.lunchCarbs = [];
                                          setState(() {
                                            for (int i = 0;
                                                i <
                                                    foodProvider
                                                        .lunchCarbsSelected
                                                        .length;
                                                i++) {
                                              if (foodProvider
                                                          .lunchCarbsSelected[i]
                                                      ['selected'] ==
                                                  true) {
                                                foodProvider.lunchCarbs
                                                    .add(CarbsChip(
                                                  name: carbs[i]['food_name'],
                                                  suffix: carbs[i]
                                                      ['food_detail'],
                                                  volume: foodProvider
                                                              .lunchCarbsSelected[
                                                          i]['volume'] is String
                                                      ? foodProvider
                                                              .lunchCarbsSelected[
                                                          i]['volume']
                                                      : foodProvider
                                                          .lunchCarbsSelected[i]
                                                              ['volume']
                                                          .toString(),
                                                ));
                                              }
                                            }
                                          });
                                        },
                                        behavior: HitTestBehavior.translucent,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "เลือกแป้งที่ทาน",
                                                style: GoogleFonts.prompt(
                                                  textStyle: const TextStyle(
                                                      letterSpacing: 0.5,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xff666666)),
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.add_circle_outline,
                                              color: Colors.blue,
                                              size: 20.0,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Consumer<FoodProvider>(
                      builder: (BuildContext context, value, Widget? child) =>
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
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
                                                  textStyle: const TextStyle(
                                                      letterSpacing: 0.66,
                                                      fontSize: 16,
                                                      color: Colors.black54)),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 12),
                                              width: double.maxFinite,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.blue)),
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
                                                  textStyle: const TextStyle(
                                                      letterSpacing: 0.66,
                                                      fontSize: 16,
                                                      color: Colors.black54)),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 12),
                                              width: double.maxFinite,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.blue)),
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
                                                  textStyle: const TextStyle(
                                                      letterSpacing: 0.66,
                                                      fontSize: 16,
                                                      color: Colors.black54)),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 12),
                                              width: double.maxFinite,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.blue)),
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
                                child: Consumer<FoodProvider>(
                                  builder: (BuildContext context, value,
                                          Widget? child) =>
                                      TextField(
                                    textAlignVertical: TextAlignVertical.center,
                                    onChanged: (text) {
                                      value.setBloodSugar(3, text);
                                    },
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
                        child: Consumer<FoodProvider>(
                          builder: (BuildContext context, foodProvider,
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
                                  GestureDetector(
                                    onTap: () async {
                                      await showModalBottomSheet<void>(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Consumer<FoodProvider>(
                                            builder: (BuildContext context,
                                                    value, Widget? child) =>
                                                Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.horizontal(
                                                          left: Radius.circular(
                                                              15),
                                                          right:
                                                              Radius.circular(
                                                                  15))),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20,
                                                      horizontal: 20),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.8,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: double.maxFinite,
                                                    child: Stack(
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "เลือกอาหารที่ทาน",
                                                            style: GoogleFonts.prompt(
                                                                textStyle: const TextStyle(
                                                                    letterSpacing:
                                                                        0.66,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Colors
                                                                        .black)),
                                                          ),
                                                        ),
                                                        Positioned.fill(
                                                            child: Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              foodProvider
                                                                  .calFood(3);
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Icon(
                                                                Icons.close),
                                                          ),
                                                        ))
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Expanded(
                                                    child: ListView.separated(
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return Row(
                                                          children: [
                                                            Checkbox(
                                                                value: value
                                                                        .dinnerSelected[
                                                                    index],
                                                                onChanged:
                                                                    (isChecked) {
                                                                  value.selectedDinner(
                                                                      index);
                                                                }),
                                                            Text(
                                                              foods[index]
                                                                  ["food_name"],
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: value.dinnerSelected[
                                                                            index] ==
                                                                        true
                                                                    ? Colors
                                                                        .blue
                                                                    : Color(
                                                                        0xff808080),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                      itemCount: foods.length,
                                                      separatorBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return Divider();
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                      foodProvider.dinner = [];
                                      setState(() {
                                        for (int i = 0;
                                            i <
                                                foodProvider
                                                    .dinnerSelected.length;
                                            i++) {
                                          if (foodProvider.dinnerSelected[i] ==
                                              true) {
                                            foodProvider.dinner.add(FoodChip(
                                                name: foods[i]['food_name']));
                                          }
                                        }
                                      });
                                    },
                                    behavior: HitTestBehavior.translucent,
                                    child: Text(
                                      "แก้ไข",
                                      style: GoogleFonts.prompt(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.blue)),
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
                                child: foodProvider.dinner.length != 0
                                    ? Wrap(
                                        spacing: 10,
                                        runSpacing: 10,
                                        direction: Axis.horizontal,
                                        clipBehavior: Clip.hardEdge,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: foodProvider.dinner,
                                      )
                                    : Container(
                                        height: 20,
                                        child: GestureDetector(
                                          onTap: () async {
                                            await showModalBottomSheet<void>(
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius
                                                              .horizontal(
                                                                  left: Radius
                                                                      .circular(
                                                                          15),
                                                                  right: Radius
                                                                      .circular(
                                                                          15))),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 20,
                                                      horizontal: 20),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.8,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width: double.maxFinite,
                                                        child: Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                "เลือกอาหารที่ทาน",
                                                                style: GoogleFonts.prompt(
                                                                    textStyle: const TextStyle(
                                                                        letterSpacing:
                                                                            0.66,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: Colors
                                                                            .black)),
                                                              ),
                                                            ),
                                                            Positioned.fill(
                                                                child: Align(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  foodProvider
                                                                      .calFood(
                                                                          3);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Icon(
                                                                    Icons
                                                                        .close),
                                                              ),
                                                            ))
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Expanded(
                                                        child: Consumer<
                                                            FoodProvider>(
                                                          builder: (BuildContext
                                                                      context,
                                                                  value,
                                                                  Widget?
                                                                      child) =>
                                                              ListView
                                                                  .separated(
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              return Row(
                                                                children: [
                                                                  Checkbox(
                                                                      value: value
                                                                              .dinnerSelected[
                                                                          index],
                                                                      onChanged:
                                                                          (isChecked) {
                                                                        value.selectedDinner(
                                                                            index);
                                                                      }),
                                                                  Text(
                                                                    foods[index]
                                                                        [
                                                                        "food_name"],
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: foodProvider.dinnerSelected[index] ==
                                                                              true
                                                                          ? Colors
                                                                              .blue
                                                                          : Color(
                                                                              0xff808080),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                            itemCount:
                                                                foods.length,
                                                            separatorBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              return Divider();
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                            foodProvider.dinner = [];
                                            setState(() {
                                              for (int i = 0;
                                                  i <
                                                      foodProvider
                                                          .dinnerSelected
                                                          .length;
                                                  i++) {
                                                if (foodProvider
                                                        .dinnerSelected[i] ==
                                                    true) {
                                                  foodProvider.dinner.add(
                                                      FoodChip(
                                                          name: foods[i]
                                                              ['food_name']));
                                                }
                                              }
                                            });
                                          },
                                          behavior: HitTestBehavior.translucent,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "เลือกอาหารที่ทาน",
                                                  style: GoogleFonts.prompt(
                                                    textStyle: const TextStyle(
                                                        letterSpacing: 0.5,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xff666666)),
                                                  ),
                                                ),
                                              ),
                                              Icon(
                                                Icons.add_circle_outline,
                                                color: Colors.blue,
                                                size: 20.0,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                              )
                            ],
                          ),
                        )),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Consumer<FoodProvider>(
                        builder: (BuildContext context, foodProvider,
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
                                GestureDetector(
                                  onTap: () async {
                                    await showModalBottomSheet<void>(
                                      isScrollControlled: true,
                                      isDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Consumer<FoodProvider>(
                                          builder: (BuildContext context, value,
                                                  Widget? child) =>
                                              Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                        left:
                                                            Radius.circular(15),
                                                        right: Radius.circular(
                                                            15))),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20, horizontal: 20),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.8,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: double.maxFinite,
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "เลือกแป้งที่ทาน",
                                                          style: GoogleFonts.prompt(
                                                              textStyle: const TextStyle(
                                                                  letterSpacing:
                                                                      0.66,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Colors
                                                                      .black)),
                                                        ),
                                                      ),
                                                      Positioned.fill(
                                                          child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            foodProvider
                                                                .calFood(3);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child:
                                                              Icon(Icons.close),
                                                        ),
                                                      ))
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Expanded(
                                                  child: ListView.separated(
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Row(
                                                        children: [
                                                          Checkbox(
                                                              value:
                                                                  value.dinnerCarbsSelected[
                                                                          index]
                                                                      [
                                                                      'selected'],
                                                              onChanged:
                                                                  (isChecked) {
                                                                value
                                                                    .selectedCarbsDinner(
                                                                        index);
                                                              }),
                                                          Expanded(
                                                            child: Text(
                                                              carbs[index]
                                                                  ["food_name"],
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: value.dinnerCarbsSelected[index]
                                                                            [
                                                                            'selected'] ==
                                                                        true
                                                                    ? Colors
                                                                        .blue
                                                                    : Color(
                                                                        0xff808080),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 40,
                                                            width: 100,
                                                            child:
                                                                TextFormField(
                                                              initialValue: value
                                                                  .dinnerCarbsSelected[
                                                                      index]
                                                                      ['volume']
                                                                  .toString(),
                                                              enabled:
                                                                  value.dinnerCarbsSelected[
                                                                          index]
                                                                      [
                                                                      'selected'],
                                                              decoration:
                                                                  InputDecoration(
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            8),
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                suffixText:
                                                                    '${carbs[index]['food_detail']}',
                                                              ),
                                                              onChanged:
                                                                  (text) {
                                                                value.dinnerCarbsSelected[
                                                                        index][
                                                                    'volume'] = text;
                                                              },
                                                            ),
                                                          )
                                                        ],
                                                      );
                                                    },
                                                    itemCount: carbs.length,
                                                    separatorBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Divider();
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                    foodProvider.dinnerCarbs = [];
                                    setState(() {
                                      for (int i = 0;
                                          i <
                                              foodProvider
                                                  .dinnerCarbsSelected.length;
                                          i++) {
                                        if (foodProvider.dinnerCarbsSelected[i]
                                                ['selected'] ==
                                            true) {
                                          foodProvider.dinnerCarbs
                                              .add(CarbsChip(
                                            name: carbs[i]['food_name'],
                                            suffix: carbs[i]['food_detail'],
                                            volume: foodProvider
                                                        .dinnerCarbsSelected[i]
                                                    ['volume'] is String
                                                ? foodProvider
                                                        .dinnerCarbsSelected[i]
                                                    ['volume']
                                                : foodProvider
                                                    .dinnerCarbsSelected[i]
                                                        ['volume']
                                                    .toString(),
                                          ));
                                        }
                                      }
                                    });
                                  },
                                  behavior: HitTestBehavior.translucent,
                                  child: Text(
                                    "แก้ไข",
                                    style: GoogleFonts.prompt(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue)),
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
                              child: foodProvider.dinnerCarbs.length != 0
                                  ? Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      direction: Axis.horizontal,
                                      clipBehavior: Clip.hardEdge,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: foodProvider.dinnerCarbs,
                                    )
                                  : Container(
                                      height: 20,
                                      child: GestureDetector(
                                        onTap: () async {
                                          await showModalBottomSheet<void>(
                                            isScrollControlled: true,
                                            isDismissible: false,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Consumer<FoodProvider>(
                                                builder: (BuildContext context,
                                                        value, Widget? child) =>
                                                    Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius
                                                              .horizontal(
                                                                  left: Radius
                                                                      .circular(
                                                                          15),
                                                                  right: Radius
                                                                      .circular(
                                                                          15))),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 20,
                                                      horizontal: 20),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.8,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width: double.maxFinite,
                                                        child: Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                "เลือกแป้งที่ทาน",
                                                                style: GoogleFonts.prompt(
                                                                    textStyle: const TextStyle(
                                                                        letterSpacing:
                                                                            0.66,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: Colors
                                                                            .black)),
                                                              ),
                                                            ),
                                                            Positioned.fill(
                                                                child: Align(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  foodProvider
                                                                      .calFood(
                                                                          3);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Icon(
                                                                    Icons
                                                                        .close),
                                                              ),
                                                            ))
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Expanded(
                                                        child:
                                                            ListView.separated(
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return Row(
                                                              children: [
                                                                Checkbox(
                                                                    value: value
                                                                            .dinnerCarbsSelected[index]
                                                                        [
                                                                        'selected'],
                                                                    onChanged:
                                                                        (isChecked) {
                                                                      value.selectedCarbsDinner(
                                                                          index);
                                                                    }),
                                                                Expanded(
                                                                  child: Text(
                                                                    carbs[index]
                                                                        [
                                                                        "food_name"],
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: value.dinnerCarbsSelected[index]['selected'] ==
                                                                              true
                                                                          ? Colors
                                                                              .blue
                                                                          : Color(
                                                                              0xff808080),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height: 40,
                                                                  width: 100,
                                                                  child:
                                                                      TextFormField(
                                                                    initialValue: value
                                                                        .dinnerCarbsSelected[
                                                                            index]
                                                                            [
                                                                            'volume']
                                                                        .toString(),
                                                                    enabled: value
                                                                            .dinnerCarbsSelected[index]
                                                                        [
                                                                        'selected'],
                                                                    decoration:
                                                                        InputDecoration(
                                                                      contentPadding: const EdgeInsets
                                                                              .symmetric(
                                                                          horizontal:
                                                                              8),
                                                                      border: OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10)),
                                                                      suffixText:
                                                                          '${carbs[index]['food_detail']}',
                                                                    ),
                                                                    onChanged:
                                                                        (text) {
                                                                      value.dinnerCarbsSelected[index]
                                                                              [
                                                                              'volume'] =
                                                                          text;
                                                                    },
                                                                  ),
                                                                )
                                                              ],
                                                            );
                                                          },
                                                          itemCount:
                                                              carbs.length,
                                                          separatorBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return Divider();
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                          foodProvider.dinnerCarbs = [];
                                          setState(() {
                                            for (int i = 0;
                                                i <
                                                    foodProvider
                                                        .dinnerCarbsSelected
                                                        .length;
                                                i++) {
                                              if (foodProvider
                                                          .dinnerCarbsSelected[
                                                      i]['selected'] ==
                                                  true) {
                                                foodProvider.dinnerCarbs
                                                    .add(CarbsChip(
                                                  name: carbs[i]['food_name'],
                                                  suffix: carbs[i]
                                                      ['food_detail'],
                                                  volume: foodProvider
                                                              .dinnerCarbsSelected[
                                                          i]['volume'] is String
                                                      ? foodProvider
                                                              .dinnerCarbsSelected[
                                                          i]['volume']
                                                      : foodProvider
                                                          .dinnerCarbsSelected[
                                                              i]['volume']
                                                          .toString(),
                                                ));
                                              }
                                            }
                                          });
                                        },
                                        behavior: HitTestBehavior.translucent,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "เลือกแป้งที่ทาน",
                                                style: GoogleFonts.prompt(
                                                  textStyle: const TextStyle(
                                                      letterSpacing: 0.5,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xff666666)),
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.add_circle_outline,
                                              color: Colors.blue,
                                              size: 20.0,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Consumer<FoodProvider>(
                      builder: (BuildContext context, value, Widget? child) =>
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
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
                                                  textStyle: const TextStyle(
                                                      letterSpacing: 0.66,
                                                      fontSize: 16,
                                                      color: Colors.black54)),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 12),
                                              width: double.maxFinite,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.blue)),
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
                                                  textStyle: const TextStyle(
                                                      letterSpacing: 0.66,
                                                      fontSize: 16,
                                                      color: Colors.black54)),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 12),
                                              width: double.maxFinite,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.blue)),
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
                                                  textStyle: const TextStyle(
                                                      letterSpacing: 0.66,
                                                      fontSize: 16,
                                                      color: Colors.black54)),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 12),
                                              width: double.maxFinite,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.blue)),
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
                                child: Consumer<FoodProvider>(
                                  builder: (BuildContext context, value,
                                          Widget? child) =>
                                      TextField(
                                    textAlignVertical: TextAlignVertical.center,
                                    onChanged: (text) {
                                      value.setBloodSugar(4, text);
                                    },
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
                                        hintText: "0"),
                                  ),
                                ))
                          ],
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Consumer<FoodProvider>(
                          builder: (BuildContext context, foodProvider,
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
                                  GestureDetector(
                                    onTap: () async {
                                      await showModalBottomSheet<void>(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Consumer<FoodProvider>(
                                            builder: (BuildContext context,
                                                    value, Widget? child) =>
                                                Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.horizontal(
                                                          left: Radius.circular(
                                                              15),
                                                          right:
                                                              Radius.circular(
                                                                  15))),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20,
                                                      horizontal: 20),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.8,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: double.maxFinite,
                                                    child: Stack(
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "เลือกอาหารที่ทาน",
                                                            style: GoogleFonts.prompt(
                                                                textStyle: const TextStyle(
                                                                    letterSpacing:
                                                                        0.66,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Colors
                                                                        .black)),
                                                          ),
                                                        ),
                                                        Positioned.fill(
                                                            child: Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              foodProvider
                                                                  .calFood(4);
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Icon(
                                                                Icons.close),
                                                          ),
                                                        ))
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Expanded(
                                                    child: ListView.separated(
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return Row(
                                                          children: [
                                                            Checkbox(
                                                                value: value
                                                                        .beforeBedSelected[
                                                                    index],
                                                                onChanged:
                                                                    (isChecked) {
                                                                  value.selectedBeforeBed(
                                                                      index);
                                                                }),
                                                            Text(
                                                              foods[index]
                                                                  ["food_name"],
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: value.beforeBedSelected[
                                                                            index] ==
                                                                        true
                                                                    ? Colors
                                                                        .blue
                                                                    : Color(
                                                                        0xff808080),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                      itemCount: foods.length,
                                                      separatorBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return Divider();
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                      foodProvider.beforeBed = [];
                                      setState(() {
                                        for (int i = 0;
                                            i <
                                                foodProvider
                                                    .beforeBedSelected.length;
                                            i++) {
                                          if (foodProvider
                                                  .beforeBedSelected[i] ==
                                              true) {
                                            foodProvider.beforeBed.add(FoodChip(
                                                name: foods[i]['food_name']));
                                          }
                                        }
                                      });
                                    },
                                    behavior: HitTestBehavior.translucent,
                                    child: Text(
                                      "แก้ไข",
                                      style: GoogleFonts.prompt(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.blue)),
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
                                child: foodProvider.beforeBed.length != 0
                                    ? Wrap(
                                        spacing: 10,
                                        runSpacing: 10,
                                        direction: Axis.horizontal,
                                        clipBehavior: Clip.hardEdge,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: foodProvider.beforeBed,
                                      )
                                    : Container(
                                        height: 20,
                                        child: GestureDetector(
                                          onTap: () async {
                                            await showModalBottomSheet<void>(
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius
                                                              .horizontal(
                                                                  left: Radius
                                                                      .circular(
                                                                          15),
                                                                  right: Radius
                                                                      .circular(
                                                                          15))),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 20,
                                                      horizontal: 20),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.8,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width: double.maxFinite,
                                                        child: Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                "เลือกอาหารที่ทาน",
                                                                style: GoogleFonts.prompt(
                                                                    textStyle: const TextStyle(
                                                                        letterSpacing:
                                                                            0.66,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: Colors
                                                                            .black)),
                                                              ),
                                                            ),
                                                            Positioned.fill(
                                                                child: Align(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  foodProvider
                                                                      .calFood(
                                                                          4);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Icon(
                                                                    Icons
                                                                        .close),
                                                              ),
                                                            ))
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Expanded(
                                                        child: Consumer<
                                                            FoodProvider>(
                                                          builder: (BuildContext
                                                                      context,
                                                                  value,
                                                                  Widget?
                                                                      child) =>
                                                              ListView
                                                                  .separated(
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              return Row(
                                                                children: [
                                                                  Checkbox(
                                                                      value: value
                                                                              .beforeBedSelected[
                                                                          index],
                                                                      onChanged:
                                                                          (isChecked) {
                                                                        value.selectedBeforeBed(
                                                                            index);
                                                                      }),
                                                                  Text(
                                                                    foods[index]
                                                                        [
                                                                        "food_name"],
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: foodProvider.beforeBedSelected[index] ==
                                                                              true
                                                                          ? Colors
                                                                              .blue
                                                                          : Color(
                                                                              0xff808080),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                            itemCount:
                                                                foods.length,
                                                            separatorBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              return Divider();
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                            foodProvider.beforeBed = [];
                                            setState(() {
                                              for (int i = 0;
                                                  i <
                                                      foodProvider
                                                          .beforeBedSelected
                                                          .length;
                                                  i++) {
                                                if (foodProvider
                                                        .beforeBedSelected[i] ==
                                                    true) {
                                                  foodProvider.beforeBed.add(
                                                      FoodChip(
                                                          name: foods[i]
                                                              ['food_name']));
                                                }
                                              }
                                            });
                                          },
                                          behavior: HitTestBehavior.translucent,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "เลือกอาหารที่ทาน",
                                                  style: GoogleFonts.prompt(
                                                    textStyle: const TextStyle(
                                                        letterSpacing: 0.5,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xff666666)),
                                                  ),
                                                ),
                                              ),
                                              Icon(
                                                Icons.add_circle_outline,
                                                color: Colors.blue,
                                                size: 20.0,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                              )
                            ],
                          ),
                        )),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Consumer<FoodProvider>(
                        builder: (BuildContext context, foodProvider,
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
                                GestureDetector(
                                  onTap: () async {
                                    await showModalBottomSheet<void>(
                                      isScrollControlled: true,
                                      isDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Consumer<FoodProvider>(
                                          builder: (BuildContext context, value,
                                                  Widget? child) =>
                                              Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                        left:
                                                            Radius.circular(15),
                                                        right: Radius.circular(
                                                            15))),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20, horizontal: 20),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.8,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: double.maxFinite,
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "เลือกแป้งที่ทาน",
                                                          style: GoogleFonts.prompt(
                                                              textStyle: const TextStyle(
                                                                  letterSpacing:
                                                                      0.66,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Colors
                                                                      .black)),
                                                        ),
                                                      ),
                                                      Positioned.fill(
                                                          child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            foodProvider
                                                                .calFood(4);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child:
                                                              Icon(Icons.close),
                                                        ),
                                                      ))
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Expanded(
                                                  child: ListView.separated(
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Row(
                                                        children: [
                                                          Checkbox(
                                                              value:
                                                                  value.beforeBedCarbsSelected[
                                                                          index]
                                                                      [
                                                                      'selected'],
                                                              onChanged:
                                                                  (isChecked) {
                                                                value
                                                                    .selectedCarbsBeforeBed(
                                                                        index);
                                                              }),
                                                          Expanded(
                                                            child: Text(
                                                              carbs[index]
                                                                  ["food_name"],
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: value.beforeBedCarbsSelected[index]
                                                                            [
                                                                            'selected'] ==
                                                                        true
                                                                    ? Colors
                                                                        .blue
                                                                    : Color(
                                                                        0xff808080),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 40,
                                                            width: 100,
                                                            child:
                                                                TextFormField(
                                                              initialValue: value
                                                                  .beforeBedCarbsSelected[
                                                                      index]
                                                                      ['volume']
                                                                  .toString(),
                                                              enabled:
                                                                  value.beforeBedCarbsSelected[
                                                                          index]
                                                                      [
                                                                      'selected'],
                                                              decoration:
                                                                  InputDecoration(
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            8),
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                suffixText:
                                                                    '${carbs[index]['food_detail']}',
                                                              ),
                                                              onChanged:
                                                                  (text) {
                                                                value.beforeBedCarbsSelected[
                                                                        index][
                                                                    'volume'] = text;
                                                              },
                                                            ),
                                                          )
                                                        ],
                                                      );
                                                    },
                                                    itemCount: carbs.length,
                                                    separatorBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Divider();
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                    foodProvider.beforeBedCarbs = [];
                                    setState(() {
                                      for (int i = 0;
                                          i <
                                              foodProvider
                                                  .beforeBedCarbsSelected
                                                  .length;
                                          i++) {
                                        if (foodProvider
                                                    .beforeBedCarbsSelected[i]
                                                ['selected'] ==
                                            true) {
                                          foodProvider.beforeBedCarbs
                                              .add(CarbsChip(
                                            name: carbs[i]['food_name'],
                                            suffix: carbs[i]['food_detail'],
                                            volume: foodProvider
                                                        .beforeBedCarbsSelected[
                                                    i]['volume'] is String
                                                ? foodProvider
                                                        .beforeBedCarbsSelected[
                                                    i]['volume']
                                                : foodProvider
                                                    .beforeBedCarbsSelected[i]
                                                        ['volume']
                                                    .toString(),
                                          ));
                                        }
                                      }
                                    });
                                  },
                                  behavior: HitTestBehavior.translucent,
                                  child: Text(
                                    "แก้ไข",
                                    style: GoogleFonts.prompt(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue)),
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
                              child: foodProvider.beforeBedCarbs.length != 0
                                  ? Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      direction: Axis.horizontal,
                                      clipBehavior: Clip.hardEdge,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: foodProvider.beforeBedCarbs,
                                    )
                                  : Container(
                                      height: 20,
                                      child: GestureDetector(
                                        onTap: () async {
                                          await showModalBottomSheet<void>(
                                            isScrollControlled: true,
                                            isDismissible: false,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Consumer<FoodProvider>(
                                                builder: (BuildContext context,
                                                        value, Widget? child) =>
                                                    Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius
                                                              .horizontal(
                                                                  left: Radius
                                                                      .circular(
                                                                          15),
                                                                  right: Radius
                                                                      .circular(
                                                                          15))),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 20,
                                                      horizontal: 20),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.8,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width: double.maxFinite,
                                                        child: Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                "เลือกแป้งที่ทาน",
                                                                style: GoogleFonts.prompt(
                                                                    textStyle: const TextStyle(
                                                                        letterSpacing:
                                                                            0.66,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: Colors
                                                                            .black)),
                                                              ),
                                                            ),
                                                            Positioned.fill(
                                                                child: Align(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  foodProvider
                                                                      .calFood(
                                                                          4);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Icon(
                                                                    Icons
                                                                        .close),
                                                              ),
                                                            ))
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Expanded(
                                                        child:
                                                            ListView.separated(
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return Row(
                                                              children: [
                                                                Checkbox(
                                                                    value: value
                                                                            .beforeBedCarbsSelected[index]
                                                                        [
                                                                        'selected'],
                                                                    onChanged:
                                                                        (isChecked) {
                                                                      value.selectedCarbsBeforeBed(
                                                                          index);
                                                                    }),
                                                                Expanded(
                                                                  child: Text(
                                                                    carbs[index]
                                                                        [
                                                                        "food_name"],
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: value.beforeBedCarbsSelected[index]['selected'] ==
                                                                              true
                                                                          ? Colors
                                                                              .blue
                                                                          : Color(
                                                                              0xff808080),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height: 40,
                                                                  width: 100,
                                                                  child:
                                                                      TextFormField(
                                                                    initialValue: value
                                                                        .beforeBedCarbsSelected[
                                                                            index]
                                                                            [
                                                                            'volume']
                                                                        .toString(),
                                                                    enabled: value
                                                                            .beforeBedCarbsSelected[index]
                                                                        [
                                                                        'selected'],
                                                                    decoration:
                                                                        InputDecoration(
                                                                      contentPadding: const EdgeInsets
                                                                              .symmetric(
                                                                          horizontal:
                                                                              8),
                                                                      border: OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10)),
                                                                      suffixText:
                                                                          '${carbs[index]['food_detail']}',
                                                                    ),
                                                                    onChanged:
                                                                        (text) {
                                                                      value.beforeBedCarbsSelected[index]
                                                                              [
                                                                              'volume'] =
                                                                          text;
                                                                    },
                                                                  ),
                                                                )
                                                              ],
                                                            );
                                                          },
                                                          itemCount:
                                                              carbs.length,
                                                          separatorBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return Divider();
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                          foodProvider.beforeBedCarbs = [];
                                          setState(() {
                                            for (int i = 0;
                                                i <
                                                    foodProvider
                                                        .beforeBedCarbsSelected
                                                        .length;
                                                i++) {
                                              if (foodProvider
                                                          .beforeBedCarbsSelected[
                                                      i]['selected'] ==
                                                  true) {
                                                foodProvider.beforeBedCarbs
                                                    .add(CarbsChip(
                                                  name: carbs[i]['food_name'],
                                                  suffix: carbs[i]
                                                      ['food_detail'],
                                                  volume: foodProvider
                                                              .beforeBedCarbsSelected[
                                                          i]['volume'] is String
                                                      ? foodProvider
                                                              .beforeBedCarbsSelected[
                                                          i]['volume']
                                                      : foodProvider
                                                          .beforeBedCarbsSelected[
                                                              i]['volume']
                                                          .toString(),
                                                ));
                                              }
                                            }
                                          });
                                        },
                                        behavior: HitTestBehavior.translucent,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "เลือกแป้งที่ทาน",
                                                style: GoogleFonts.prompt(
                                                  textStyle: const TextStyle(
                                                      letterSpacing: 0.5,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xff666666)),
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.add_circle_outline,
                                              color: Colors.blue,
                                              size: 20.0,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Consumer<FoodProvider>(
                      builder: (BuildContext context, value, Widget? child) =>
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
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
                                                  textStyle: const TextStyle(
                                                      letterSpacing: 0.66,
                                                      fontSize: 16,
                                                      color: Colors.black54)),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 12),
                                              width: double.maxFinite,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.blue)),
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
                                                  textStyle: const TextStyle(
                                                      letterSpacing: 0.66,
                                                      fontSize: 16,
                                                      color: Colors.black54)),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 12),
                                              width: double.maxFinite,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.blue)),
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
                                                  textStyle: const TextStyle(
                                                      letterSpacing: 0.66,
                                                      fontSize: 16,
                                                      color: Colors.black54)),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 12),
                                              width: double.maxFinite,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.blue)),
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
      bottomNavigationBar: Consumer<FoodProvider>(
        builder: (BuildContext context, value, Widget? child) => Container(
          color: Colors.white,
          padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
          height: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  value.saveData();
                  Navigator.pop(context, true);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue),
                  child: const Text(
                    'บันทึก',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
