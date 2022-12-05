class Nutrient {
  double? totalProtein;
  double? totalCarbohydrate;
  double? totalCalories;

  Nutrient({
    this.totalProtein,
    this.totalCarbohydrate,
    this.totalCalories,
  });

  Nutrient.fromJson(Map<String, dynamic> json) {
    totalProtein = json['total_protein'];
    totalCarbohydrate = json['total_carbohydrate'];
    totalCalories = json['total_calories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_protein'] = this.totalProtein;
    data['total_carbohydrate'] = this.totalCarbohydrate;
    data['total_calories'] = this.totalCalories;
    return data;
  }
}
