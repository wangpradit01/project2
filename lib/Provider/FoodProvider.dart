import 'package:baowan/Data/FoodList.dart';
import 'package:baowan/Data/NutrientModel.dart';
import 'package:baowan/services/supabase_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

class FoodProvider with ChangeNotifier {
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

  void selectedBreakfast(int i) {
    breakfastSelected[i] = !breakfastSelected[i];
    notifyListeners();
  }

  void selectedLunch(int i) {
    lunchSelected[i] = !lunchSelected[i];
    notifyListeners();
  }

  void selectedDinner(int i) {
    dinnerSelected[i] = !dinnerSelected[i];
    notifyListeners();
  }

  void selectedBeforeBed(int i) {
    beforeBedSelected[i] = !beforeBedSelected[i];
    notifyListeners();
  }

  void selectedCarbsBreakfast(int i) {
    breakfastCarbsSelected[i]['selected'] =
        !breakfastCarbsSelected[i]['selected'];
    if (breakfastCarbsSelected[i]['selected'] == false) {
      breakfastCarbsSelected[i]['volume'] = 0;
    }
    notifyListeners();
  }

  void selectedCarbsLunch(int i) {
    lunchCarbsSelected[i]['selected'] = !lunchCarbsSelected[i]['selected'];
    if (lunchCarbsSelected[i]['selected'] == false) {
      lunchCarbsSelected[i]['volume'] = 0;
    }
    notifyListeners();
  }

  void selectedCarbsDinner(int i) {
    dinnerCarbsSelected[i]['selected'] = !dinnerCarbsSelected[i]['selected'];
    if (dinnerCarbsSelected[i]['selected'] == false) {
      dinnerCarbsSelected[i]['volume'] = 0;
    }
    notifyListeners();
  }

  void selectedCarbsBeforeBed(int i) {
    beforeBedCarbsSelected[i]['selected'] =
        !beforeBedCarbsSelected[i]['selected'];
    if (beforeBedCarbsSelected[i]['selected'] == false) {
      beforeBedCarbsSelected[i]['volume'] = 0;
    }
    notifyListeners();
  }

  Future<void> saveData() async {
    var dataBreakfast = [];
    var dataLunch = [];
    var dataDinner = [];
    var dataBeforeBed = [];

    for (var i = 0; i < breakfastSelected.length; i++) {
      if (breakfastSelected[i] == true) {
        dataBreakfast.add(foods[i]);
      }
    }
    for (var i = 0; i < lunchSelected.length; i++) {
      if (lunchSelected[i] == true) {
        dataLunch.add(foods[i]);
      }
    }
    for (var i = 0; i < dinnerSelected.length; i++) {
      if (dinnerSelected[i] == true) {
        dataDinner.add(foods[i]);
      }
    }
    for (var i = 0; i < beforeBedSelected.length; i++) {
      if (beforeBedSelected[i] == true) {
        dataBeforeBed.add(foods[i]);
      }
    }

    var dataCarbsBreakfast = [];
    var dataCarbsLunch = [];
    var dataCarbsDinner = [];
    var dataCarbsBeforeBed = [];

    for (var i = 0; i < breakfastCarbsSelected.length; i++) {
      if (breakfastCarbsSelected[i]['selected'] == true) {
        var added_payload = carbs[i];
        added_payload["volume"] = breakfastCarbsSelected[i]['volume'];
        dataCarbsBreakfast.add(added_payload);
      }
    }
    for (var i = 0; i < lunchCarbsSelected.length; i++) {
      if (lunchCarbsSelected[i]['selected'] == true) {
        var added_payload = carbs[i];
        added_payload["volume"] = lunchCarbsSelected[i]['volume'];
        dataCarbsLunch.add(added_payload);
      }
    }
    for (var i = 0; i < dinnerCarbsSelected.length; i++) {
      if (dinnerCarbsSelected[i]['selected'] == true) {
        var added_payload = carbs[i];
        added_payload["volume"] = dinnerCarbsSelected[i]['volume'];
        dataCarbsDinner.add(added_payload);
      }
    }
    for (var i = 0; i < beforeBedCarbsSelected.length; i++) {
      if (beforeBedCarbsSelected[i]['selected'] == true) {
        var added_payload = carbs[i];
        added_payload["volume"] = beforeBedCarbsSelected[i]['volume'];
        dataCarbsBeforeBed.add(added_payload);
      }
    }

    Map<String, dynamic> data = {
      "created_at": DateTime.now().toString(),
      "breakfast": dataBreakfast,
      "lunch": dataLunch,
      "dinner": dataDinner,
      "before_bed": dataBeforeBed,
      "breakfast_carbs": dataCarbsBreakfast,
      "lunch_carbs": dataCarbsLunch,
      "dinner_carbs": dataCarbsDinner,
      "before_bed_carbs": dataCarbsBeforeBed,
      "breakfast_total_nutrient": breakfastNutrients!.toJson(),
      "lunch_total_nutrient": lunchNutrients!.toJson(),
      "dinner_total_nutrient": dinnerNutrients!.toJson(),
      "before_bed_total_nutrient": beforeBedNutrients!.toJson(),
      "user_id": 1,
      "breakfast_blood_sugar": double.parse(bsBreakfast),
      "lunch_blood_sugar": double.parse(bsLunch),
      "dinner_blood_sugar": double.parse(bsDinner),
      "before_bed_blood_sugar": double.parse(bsBeforeBed),
    };
    await SupabaseService.addData(data);
    reset();
  }

  void setBloodSugar(int type, String value) {
    if (type == 1) {
      bsBreakfast = value;
    }
    if (type == 2) {
      bsLunch = value;
    }
    if (type == 3) {
      bsDinner = value;
    }
    if (type == 4) {
      bsBeforeBed = value;
    }
    notifyListeners();
  }

  void calFood(int type) {
    if (type == 1) {
      breakfastNutrients =
          Nutrient(totalProtein: 0, totalCalories: 0, totalCarbohydrate: 0);
      for (var i = 0; i < breakfastSelected.length; i++) {
        if (breakfastSelected[i] == true) {
          breakfastNutrients!.totalProtein =
              breakfastNutrients!.totalProtein! + foods[i]['food_protein'];
          breakfastNutrients!.totalCarbohydrate =
              breakfastNutrients!.totalCarbohydrate! + foods[i]['food_carb'];
          breakfastNutrients!.totalCalories =
              breakfastNutrients!.totalCalories! + foods[i]['food_cal'];
        }
      }
      for (var i = 0; i < breakfastCarbsSelected.length; i++) {
        if (breakfastCarbsSelected[i]['selected'] == true) {
          breakfastNutrients!.totalProtein = breakfastNutrients!.totalProtein! +
              (carbs[i]['food_protein'] *
                  (breakfastCarbsSelected[i]['volume'] is String
                      ? int.parse(breakfastCarbsSelected[i]['volume'])
                      : breakfastCarbsSelected[i]['volume']));
          breakfastNutrients!.totalCarbohydrate =
              breakfastNutrients!.totalCarbohydrate! +
                  (carbs[i]['food_carb'] *
                      (breakfastCarbsSelected[i]['volume'] is String
                          ? int.parse(breakfastCarbsSelected[i]['volume'])
                          : breakfastCarbsSelected[i]['volume']));
          breakfastNutrients!.totalCalories =
              breakfastNutrients!.totalCalories! +
                  (carbs[i]['food_cal'] *
                      (breakfastCarbsSelected[i]['volume'] is String
                          ? int.parse(breakfastCarbsSelected[i]['volume'])
                          : breakfastCarbsSelected[i]['volume']));
        }
      }
    }
    if (type == 2) {
      lunchNutrients =
          Nutrient(totalProtein: 0, totalCalories: 0, totalCarbohydrate: 0);
      for (var i = 0; i < lunchSelected.length; i++) {
        if (lunchSelected[i] == true) {
          lunchNutrients!.totalProtein =
              lunchNutrients!.totalProtein! + foods[i]['food_protein'];
          lunchNutrients!.totalCarbohydrate =
              lunchNutrients!.totalCarbohydrate! + foods[i]['food_carb'];
          lunchNutrients!.totalCalories =
              lunchNutrients!.totalCalories! + foods[i]['food_cal'];
        }
      }
      for (var i = 0; i < lunchCarbsSelected.length; i++) {
        if (lunchCarbsSelected[i]['selected'] == true) {
          lunchNutrients!.totalProtein = lunchNutrients!.totalProtein! +
              (carbs[i]['food_protein'] *
                  (lunchCarbsSelected[i]['volume'] is String
                      ? int.parse(lunchCarbsSelected[i]['volume'])
                      : lunchCarbsSelected[i]['volume']));
          lunchNutrients!.totalCarbohydrate =
              lunchNutrients!.totalCarbohydrate! +
                  (carbs[i]['food_carb'] *
                      (lunchCarbsSelected[i]['volume'] is String
                          ? int.parse(lunchCarbsSelected[i]['volume'])
                          : lunchCarbsSelected[i]['volume']));
          lunchNutrients!.totalCalories = lunchNutrients!.totalCalories! +
              (carbs[i]['food_cal'] *
                  (lunchCarbsSelected[i]['volume'] is String
                      ? int.parse(lunchCarbsSelected[i]['volume'])
                      : lunchCarbsSelected[i]['volume']));
        }
      }
    }
    if (type == 3) {
      dinnerNutrients =
          Nutrient(totalProtein: 0, totalCalories: 0, totalCarbohydrate: 0);
      for (var i = 0; i < dinnerSelected.length; i++) {
        if (dinnerSelected[i] == true) {
          dinnerNutrients!.totalProtein =
              dinnerNutrients!.totalProtein! + foods[i]['food_protein'];
          dinnerNutrients!.totalCarbohydrate =
              dinnerNutrients!.totalCarbohydrate! + foods[i]['food_carb'];
          dinnerNutrients!.totalCalories =
              dinnerNutrients!.totalCalories! + foods[i]['food_cal'];
        }
      }
      for (var i = 0; i < dinnerCarbsSelected.length; i++) {
        if (dinnerCarbsSelected[i]['selected'] == true) {
          dinnerNutrients!.totalProtein = dinnerNutrients!.totalProtein! +
              (carbs[i]['food_protein'] *
                  (dinnerCarbsSelected[i]['volume'] is String
                      ? int.parse(dinnerCarbsSelected[i]['volume'])
                      : dinnerCarbsSelected[i]['volume']));
          dinnerNutrients!.totalCarbohydrate =
              dinnerNutrients!.totalCarbohydrate! +
                  (carbs[i]['food_carb'] *
                      (dinnerCarbsSelected[i]['volume'] is String
                          ? int.parse(dinnerCarbsSelected[i]['volume'])
                          : dinnerCarbsSelected[i]['volume']));
          dinnerNutrients!.totalCalories = dinnerNutrients!.totalCalories! +
              (carbs[i]['food_cal'] *
                  (dinnerCarbsSelected[i]['volume'] is String
                      ? int.parse(dinnerCarbsSelected[i]['volume'])
                      : dinnerCarbsSelected[i]['volume']));
        }
      }
    }
    if (type == 4) {
      beforeBedNutrients =
          Nutrient(totalProtein: 0, totalCalories: 0, totalCarbohydrate: 0);
      for (var i = 0; i < beforeBedSelected.length; i++) {
        if (beforeBedSelected[i] == true) {
          beforeBedNutrients!.totalProtein =
              beforeBedNutrients!.totalProtein! + foods[i]['food_protein'];
          beforeBedNutrients!.totalCarbohydrate =
              beforeBedNutrients!.totalCarbohydrate! + foods[i]['food_carb'];
          beforeBedNutrients!.totalCalories =
              beforeBedNutrients!.totalCalories! + foods[i]['food_cal'];
        }
      }
      for (var i = 0; i < beforeBedCarbsSelected.length; i++) {
        if (beforeBedCarbsSelected[i]['selected'] == true) {
          beforeBedNutrients!.totalProtein = beforeBedNutrients!.totalProtein! +
              (carbs[i]['food_protein'] *
                  (beforeBedCarbsSelected[i]['volume'] is String
                      ? int.parse(beforeBedCarbsSelected[i]['volume'])
                      : beforeBedCarbsSelected[i]['volume']));
          beforeBedNutrients!.totalCarbohydrate =
              beforeBedNutrients!.totalCarbohydrate! +
                  (carbs[i]['food_carb'] *
                      (beforeBedCarbsSelected[i]['volume'] is String
                          ? int.parse(beforeBedCarbsSelected[i]['volume'])
                          : beforeBedCarbsSelected[i]['volume']));
          beforeBedNutrients!.totalCalories =
              beforeBedNutrients!.totalCalories! +
                  (carbs[i]['food_cal'] *
                      (beforeBedCarbsSelected[i]['volume'] is String
                          ? int.parse(beforeBedCarbsSelected[i]['volume'])
                          : beforeBedCarbsSelected[i]['volume']));
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
    return Consumer<FoodProvider>(
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
    return Consumer<FoodProvider>(
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
