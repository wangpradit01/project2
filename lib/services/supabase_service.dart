import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {

  String supabaseUrl = "https://whclnudmfkhwsdzofyuo.supabase.co";
  String supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndoY2xudWRtZmtod3Nkem9meXVvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjQ4OTI3MTAsImV4cCI6MTk4MDQ2ODcxMH0.hKiCcw2gzr0LjO3T_E_qCbWcqqBy6u-Zn_QO1ERyMT4";

static SupabaseClient? client;
SupabaseService.init() {
  client = SupabaseClient(supabaseUrl, supabaseKey);
}


static getFood() async {

 final res  = await client!.from('Food').select('*').execute();


 print(res.data);
}


static addFood() async {


  final res = await client!.from('Food').insert({


    "name" : "TEST2",
    "carb" : 0,
    "protein" : 0,
    "cal" : 0,
  }).execute();


  print(res.status);
}





}