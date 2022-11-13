import 'package:baowan/Data/FoodList.dart';
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
