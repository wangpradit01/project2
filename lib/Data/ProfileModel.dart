class Profile {
  int? id;
  String? created;
  String? email;
  String? password;
  String? name;
  int? gender;
  String? updated;
  String? birth;

  Profile({
    this.id,
    this.created,
    this.email,
    this.password,
    this.name,
    this.gender,
    this.updated,
    this.birth,
  });

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json['created_at'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    gender = json['gender'];
    updated = json['updated_at'];
    birth = json['birth_date'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['total_protein'] = this.totalProtein;
  //   data['total_carbohydrate'] = this.totalCarbohydrate;
  //   data['total_calories'] = this.totalCalories;
  //   return data;
  // }
}
