import 'package:baowan/Data/FoodList.dart';
import 'package:baowan/Data/GlobalVar.dart';
import 'package:baowan/Data/ProfileModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  String supabaseUrl = "https://tsipaksrpfnlqivbhzmn.supabase.co";
  String supabaseKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRzaXBha3NycGZubHFpdmJoem1uIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzAxNTg3NjksImV4cCI6MTk4NTczNDc2OX0.XdyOttthXWZQA4zXYm4uDTIQ-EeZpF9Vg3xKb-SNa5M";

  static SupabaseClient? client;

  SupabaseService.init() {
    client = SupabaseClient(supabaseUrl, supabaseKey);
  }

  static getHistory() async {
    final res = await client!
        .from('baowan_data')
        .select()
        .filter('user_id', 'eq', profile!.id)
        .execute();
    return res.data;
  }

  static getProfile() async {
    final res = await client!.from('profile').select().execute();
    print(res.data);
    return res.data;
  }

  static Future<bool?> login(String email, String password) async {
    final res = await client!
        .from('profile')
        .select()
        .match({'email': email, 'password': password}).execute();
    if (res.data.length == 0) {
      return false;
    }
    if (res.data.length > 0) {
      profile = Profile.fromJson(res.data[0]);
      return true;
    }
  }

  static getFood() async {
    final res = await client!.from('food').select().execute();
    foods = res.data;
  }

  static getCarb() async {
    final res = await client!.from('carb').select().execute();
    carbs = res.data;
  }

  static addData(var payload) async {
    final res = await client!.from('baowan_data').insert(payload).execute();
    print(res.status);
  }
}
