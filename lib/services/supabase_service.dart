import 'package:baowan/Data/FoodList.dart';
import 'package:baowan/Data/GlobalVar.dart';
import 'package:baowan/Data/ProfileModel.dart';
import 'package:intl/intl.dart';
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

  static addClock({DateTime? time, String? note, bool? active}) async {
    final data = await client!.from('time_noti').insert({
      'user_id': profile!.id,
      'time': time!.toString(),
      'note': note == '' ? 'ไม่มีคำบรรยาย' : note,
      'status': active.toString()
    }).execute();
    return data.data[0];
  }

  static deleteClock(int id) async {
    final data =
        await client!.from('time_noti').delete().match({'id': id}).execute();
  }

  static getProfile() async {
    final res = await client!.from('profile').select().execute();
    print(res.data);
    return res.data;
  }

  static changePassword(String newPassword) async {
    await client!.from('profile').update({
      'password': newPassword,
    }).match({'id': profile!.id}).execute();
  }

  static resetPassword(String email, String newPassword) async {
    final res = await client!.from('profile').update({
      'password': newPassword,
    }).match({'email': email}).execute();
    print(res.data);
    return res.data;
  }

  static checkEmail(String? email) async {
    final res = await client!.from('profile').select().match({
      'email': email,
    }).execute();
    return res.data;
  }

  static createAccount(
      {String? email,
      String? password,
      String? birth,
      String? name,
      bool? isMale}) async {
    final data = await client!.from('profile').insert({
      'email': email,
      'password': password,
      'name': name,
      'birth_date': birth,
      'gender': isMale! ? 0 : 1,
    }).execute();
    return data.data[0];
  }

  static editClockStatus(int id, bool value) async {
    final res = await client!
        .from('time_noti')
        .update({
          'status': value,
        })
        .eq('id', id)
        .execute();
  }

  static getClock() async {
    final res = await client!
        .from('time_noti')
        .select()
        .filter('user_id', 'eq', profile!.id)
        .execute();
    print(res.data);
    return res.data;
  }

  static updateProfile(
      {String? name, String? email, bool? isMale, DateTime? birth}) async {
    String? birthPayloadData = DateFormat('yyyy-MM-dd').format(birth!);
    final res = await client!
        .from('profile')
        .update({
          'name': name!,
          'email': email!,
          'birth_date': birthPayloadData,
          'gender': isMale! ? 0 : 1
        })
        .eq('id', profile!.id)
        .execute();
    print(res.data);
    profile = Profile.fromJson(res.data[0]);
    return true;
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
