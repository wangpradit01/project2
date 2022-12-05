import 'package:baowan/Data/FoodList.dart';
import 'package:baowan/Data/NutrientModel.dart';
import 'package:baowan/services/supabase_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

class HistoryProvider with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  List<Widget> breakfast = [];
  List<bool> breakfastSelected = List.generate(foods.length, (index) => false);
  List<Widget> lunch = [];
  List<bool> lunchSelected = List.generate(foods.length, (index) => false);
  List<Widget> dinner = [];
  List<bool> dinnerSelected = List.generate(foods.length, (index) => false);
  List<Widget> beforeBed = [];
  List<bool> beforeBedSelected = List.generate(foods.length, (index) => false);

  List<Widget> breakfastCarbs = [];
  List<Map<String, dynamic>> breakfastCarbsSelected =
      List.generate(carbs.length, (index) => {"selected": false, "volume": 0});
  List<Widget> lunchCarbs = [];
  List<Map<String, dynamic>> lunchCarbsSelected =
      List.generate(carbs.length, (index) => {"selected": false, "volume": 0});
  List<Widget> dinnerCarbs = [];
  List<Map<String, dynamic>> dinnerCarbsSelected =
      List.generate(carbs.length, (index) => {"selected": false, "volume": 0});
  List<Widget> beforeBedCarbs = [];
  List<Map<String, dynamic>> beforeBedCarbsSelected =
      List.generate(carbs.length, (index) => {"selected": false, "volume": 0});

  Nutrient? breakfastNutrients =
      Nutrient(totalProtein: 0, totalCalories: 0, totalCarbohydrate: 0);
  Nutrient? lunchNutrients =
      Nutrient(totalProtein: 0, totalCalories: 0, totalCarbohydrate: 0);
  Nutrient? dinnerNutrients =
      Nutrient(totalProtein: 0, totalCalories: 0, totalCarbohydrate: 0);
  Nutrient? beforeBedNutrients =
      Nutrient(totalProtein: 0, totalCalories: 0, totalCarbohydrate: 0);

  String bsBreakfast = '0';
  String bsLunch = '0';
  String bsDinner = '0';
  String bsBeforeBed = '0';

  void setData(var data) {
    for (var i = 0; i < data['breakfast'].length; i++) {
      for (var j = 0; j < foods.length; j++) {
        if (foods[j]['id'] == data['breakfast'][i]['id']) {
          breakfastSelected[j] = true;
          breakfast.add(FoodChip(name: foods[j]['food_name']));
        }
      }
    }
    for (var i = 0; i < data['lunch'].length; i++) {
      for (var j = 0; j < foods.length; j++) {
        if (foods[j]['id'] == data['lunch'][i]['id']) {
          lunchSelected[j] = true;
          lunch.add(FoodChip(name: foods[j]['food_name']));
        }
      }
    }
    for (var i = 0; i < data['dinner'].length; i++) {
      for (var j = 0; j < foods.length; j++) {
        if (foods[j]['id'] == data['dinner'][i]['id']) {
          dinnerSelected[j] = true;
          dinner.add(FoodChip(name: foods[j]['food_name']));
        }
      }
    }
    for (var i = 0; i < data['before_bed'].length; i++) {
      for (var j = 0; j < foods.length; j++) {
        if (foods[j]['id'] == data['before_bed'][i]['id']) {
          beforeBedSelected[j] = true;
          beforeBed.add(FoodChip(name: foods[j]['food_name']));
        }
      }
    }
    breakfastNutrients = Nutrient.fromJson(data['breakfast_total_nutrient']);
    lunchNutrients = Nutrient.fromJson(data['lunch_total_nutrient']);
    dinnerNutrients = Nutrient.fromJson(data['dinner_total_nutrient']);
    beforeBedNutrients = Nutrient.fromJson(data['before_bed_total_nutrient']);

    bsBreakfast = data['breakfast_blood_sugar'].toString();
    bsLunch = data['lunch_blood_sugar'].toString();
    bsDinner = data['dinner_blood_sugar'].toString();
    bsBeforeBed = data['before_bed_blood_sugar'].toString();

    for (var i = 0; i < data['breakfast_carbs'].length; i++) {
      for (var j = 0; j < carbs.length; j++) {
        if (carbs[j]['id'] == data['breakfast_carbs'][i]['id']) {
          breakfastCarbsSelected[j]['selected'] = true;
          breakfastCarbsSelected[j]['volume'] =
              data['breakfast_carbs'][i]['volume'];
          breakfastCarbs.add(CarbsChip(
            name: carbs[j]['food_name'],
            suffix: data['breakfast_carbs'][i]['food_detail'],
            volume: data['breakfast_carbs'][i]['volume'],
          ));
        }
      }
    }
    for (var i = 0; i < data['lunch_carbs'].length; i++) {
      for (var j = 0; j < carbs.length; j++) {
        if (carbs[j]['id'] == data['lunch_carbs'][i]['id']) {
          lunchCarbsSelected[j]['selected'] = true;
          lunchCarbsSelected[j]['volume'] = data['lunch_carbs'][i]['volume'];
          lunchCarbs.add(CarbsChip(
            name: carbs[j]['food_name'],
            suffix: data['lunch_carbs'][i]['food_detail'],
            volume: data['lunch_carbs'][i]['volume'],
          ));
        }
      }
    }
    for (var i = 0; i < data['dinner_carbs'].length; i++) {
      for (var j = 0; j < carbs.length; j++) {
        if (carbs[j]['id'] == data['dinner_carbs'][i]['id']) {
          dinnerCarbsSelected[j]['selected'] = true;
          dinnerCarbsSelected[j]['volume'] = data['dinner_carbs'][i]['volume'];
          dinnerCarbs.add(CarbsChip(
            name: carbs[j]['food_name'],
            suffix: data['dinner_carbs'][i]['food_detail'],
            volume: data['dinner_carbs'][i]['volume'],
          ));
        }
      }
    }
    for (var i = 0; i < data['before_bed_carbs'].length; i++) {
      for (var j = 0; j < carbs.length; j++) {
        if (carbs[j]['id'] == data['before_bed_carbs'][i]['id']) {
          beforeBedCarbsSelected[j]['selected'] = true;
          beforeBedCarbsSelected[j]['volume'] =
              data['before_bed_carbs'][i]['volume'];
          beforeBedCarbs.add(CarbsChip(
            name: carbs[j]['food_name'],
            suffix: data['before_bed_carbs'][i]['food_detail'],
            volume: data['before_bed_carbs'][i]['volume'],
          ));
        }
      }
    }
  }

  void reset() {
    breakfast = [];
    breakfastSelected = List.generate(foods.length, (index) => false);
    lunch = [];
    lunchSelected = List.generate(foods.length, (index) => false);
    dinner = [];
    dinnerSelected = List.generate(foods.length, (index) => false);
    beforeBed = [];
    beforeBedSelected = List.generate(foods.length, (index) => false);

    breakfastNutrients =
        Nutrient(totalProtein: 0, totalCalories: 0, totalCarbohydrate: 0);
    lunchNutrients =
        Nutrient(totalProtein: 0, totalCalories: 0, totalCarbohydrate: 0);
    dinnerNutrients =
        Nutrient(totalProtein: 0, totalCalories: 0, totalCarbohydrate: 0);
    beforeBedNutrients =
        Nutrient(totalProtein: 0, totalCalories: 0, totalCarbohydrate: 0);

    breakfastCarbs = [];
    breakfastCarbsSelected = List.generate(
        carbs.length, (index) => {"selected": false, "volume": 0});
    lunchCarbs = [];
    lunchCarbsSelected = List.generate(
        carbs.length, (index) => {"selected": false, "volume": 0});
    dinnerCarbs = [];
    dinnerCarbsSelected = List.generate(
        carbs.length, (index) => {"selected": false, "volume": 0});
    beforeBedCarbs = [];
    beforeBedCarbsSelected = List.generate(
        carbs.length, (index) => {"selected": false, "volume": 0});

    bsBreakfast = '0';
    bsLunch = '0';
    bsDinner = '0';
    bsBeforeBed = '0';
    notifyListeners();
  }
}

class FoodChip extends StatefulWidget {
  final String name;
  const FoodChip({Key? key, required this.name}) : super(key: key);

  @override
  State<FoodChip> createState() => _FoodChipState();
}

class _FoodChipState extends State<FoodChip> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryProvider>(
      builder: (BuildContext context, value, Widget? child) => Container(
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.name,
              style: TextStyle(
                letterSpacing: 0.66,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarbsChip extends StatefulWidget {
  final String name;
  final String volume;
  final String suffix;
  const CarbsChip(
      {Key? key,
      required this.name,
      required this.volume,
      required this.suffix})
      : super(key: key);

  @override
  State<CarbsChip> createState() => _CarbsChipState();
}

class _CarbsChipState extends State<CarbsChip> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryProvider>(
      builder: (BuildContext context, value, Widget? child) => Container(
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.name,
              style: TextStyle(
                letterSpacing: 0.66,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              widget.volume.toString(),
              style: TextStyle(
                letterSpacing: 0.66,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              widget.suffix,
              style: TextStyle(
                letterSpacing: 0.66,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
