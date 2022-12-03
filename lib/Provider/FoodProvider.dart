import 'package:baowan/Data/FoodList.dart';
import 'package:baowan/Data/NutrientModel.dart';
import 'package:flutter/material.dart';
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

  Nutrient? breakfastNutrients =
      Nutrient(totalProtein: 0, totalCalories: 0, totalCarbohydrate: 0);
  Nutrient? lunchNutrients =
      Nutrient(totalProtein: 0, totalCalories: 0, totalCarbohydrate: 0);
  Nutrient? dinnerNutrients =
      Nutrient(totalProtein: 0, totalCalories: 0, totalCarbohydrate: 0);
  Nutrient? beforeBedNutrients =
      Nutrient(totalProtein: 0, totalCalories: 0, totalCarbohydrate: 0);

  void setBreakfastSelected(List<bool> list) {
    breakfastSelected = list;
    notifyListeners();
  }

  void setLunchSelected(List<bool> list) {
    lunchSelected = list;
    notifyListeners();
  }

  void setDinnerSelected(List<bool> list) {
    dinnerSelected = list;
    notifyListeners();
  }

  void setBeforeBedSelected(List<bool> list) {
    beforeBedSelected = list;
    notifyListeners();
  }

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

  void addBreakfast() {
    breakfast = [];
    for (int i = 0; i < breakfastSelected.length; i++) {
      if (breakfastSelected[i] == true) {
        breakfast.add(FoodChip(
          name: foods[i]['food_name'],
        ));
      }
    }
  }

  void calFood(int type) {
    if (type == 1) {
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
    }
    if (type == 2) {
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
    }
    if (type == 3) {
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
    }
    if (type == 4) {
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
    }
  }

  void reset() {
    _count = 0;
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
            // SizedBox(
            //   width: 5,
            // ),
            // GestureDetector(
            //   onTap: () {
            //     for (var i = 0; i < foods.length; i++) {
            //       if (foods[i]['food_name'] == widget.name) {
            //         value.
            //       }
            //     }
            //   },
            //   behavior: HitTestBehavior.translucent,
            //   child: Icon(
            //     Icons.close,
            //     color: Colors.white,
            //     size: 15,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
