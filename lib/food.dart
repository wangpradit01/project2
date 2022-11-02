
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import 'FoodData.dart';

class Food extends StatefulWidget {
  const Food({Key? key}) : super(key: key);

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  TextEditingController? _textEditingController = TextEditingController();
  List<Map<String, dynamic>> searchFood = [];
  @override
  void initState() {
    setState(() {
      searchFood = foods;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Color(0xff3B81FF),
          title: Text(
            "ข้อมูลโภชนาการ",
            style: GoogleFonts.prompt(
              textStyle: const TextStyle(
                  letterSpacing: .54,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ),
        body: Column(children: [
          SizedBox(
            height: 10,
          ),
          Container(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              // onTap: () => print('tap'),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 65,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Center(
                  child: Container(
                    child: TextField(
                        controller: _textEditingController,
                        style: GoogleFonts.prompt(
                          textStyle: const TextStyle(
                              letterSpacing: .39,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            hintText: "ค้นหาเมนูอาหาร",
                            prefixIcon: Icon(
                              Icons.search_rounded,
                            ),
                            prefixIconColor: Color(0xffAFAFAF),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.grey))),
                        onChanged: (value) {
                          setState(() {
                            searchFood = foods
                                .where((element) =>
                                    element["food_name"].contains(value))
                                .toList();
                          });
                        }),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: searchFood.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodData(
                      foodTitle: searchFood[index]['food_name'],
                      foodDetail: searchFood[index]['food_detail'],
                      foodProteinDetail: searchFood[index]['food_proteindetail'],
                      foodImage: searchFood[index]['food_img'],
                      foodCal: searchFood[index]['food_cal'],
                      foodCarb: searchFood[index]['food_carb'],
                      foodProtein: searchFood[index]['food_protein'],
                      foodCalDetail: searchFood[index]['food_caldetail'],
                    ),
                  )),
              title: Text(
                '${searchFood[index]['food_name']}',
                style: GoogleFonts.prompt(
                  textStyle: const TextStyle(
                      letterSpacing: .39,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),
          ))
        ]));
  }
}

final List<Map<String, dynamic>> foods = [
  {
    "id": 1,
    "food_name": "กล้วยน้ำว้า",
    "food_carb": 1.0 ,
    "food_detail": "ลูก",
    "food_protein": 1.2,
    "food_proteindetail": "กรัม",
    "food_cal": 122.0,
    "food_caldetail": "กิโลแคลอรี่",
    "food_img":
        "https://img.kapook.com/u/2020/Tanapol/health/banana/banana1.jpg"
  },
  {
    "id": 2,
    "food_name": "แก้วมังกร",
    "food_carb": 1.0 ,
    "food_detail": "ลูก",
    "food_protein": 2.0,
    "food_proteindetail": "กรัม",
    "food_cal": 66.0,
    "food_caldetail": "กิโลแคลอรี่",
    "food_img": 
        "https://s.isanook.com/he/0/ud/2/13057/13057-thumbnail.jpg"
  },
  {
    "id": 3,
    "food_name": "ขนมปัง",
    "food_carb": 1.0 ,
    "food_detail": "แผ่น",
    "food_protein": 3.0,
    "food_proteindetail": "กรัม",
    "food_cal": 65.0,
    "food_caldetail": "กิโลแคลอรี่",
    "food_img":
        "https://chillchilljapan.com/wp-content/uploads/2021/08/pixta_77127395_M.jpg"
  },
  {
    "id": 4,
    "food_name": "ข้าวกล้อง",
    "food_carb": 1.0 ,
    "food_detail": "ทัพพี",
    "food_protein": 2.6,
    "food_proteindetail": "กรัม",
    "food_cal": 223.0,
    "food_caldetail": "กิโลแคลอรี่",
    "food_img":
        "https://www.sgethai.com/wp-content/uploads/2020/10/201030-Content-%E0%B8%82%E0%B9%89%E0%B8%B2%E0%B8%A7%E0%B9%84%E0%B8%A3%E0%B8%8B%E0%B9%8C%E0%B9%80%E0%B8%9A%E0%B8%AD%E0%B8%A3%E0%B9%8C%E0%B8%A3%E0%B8%B5%E0%B9%88%E0%B8%81%E0%B8%B1%E0%B8%9A%E0%B8%82%E0%B9%89%E0%B8%B2%E0%B8%A7%E0%B8%81%E0%B8%A5%E0%B9%89%E0%B8%AD%E0%B8%87-%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B9%82%E0%B8%A2%E0%B8%8A%E0%B8%99%E0%B9%8C%E0%B8%97%E0%B8%B5%E0%B9%88%E0%B9%80%E0%B8%AB%E0%B8%A1%E0%B8%B7%E0%B8%AD%E0%B8%99%E0%B8%AB%E0%B8%A3%E0%B8%B7%E0%B8%AD%E0%B9%81%E0%B8%95%E0%B8%81%E0%B8%95%E0%B9%88%E0%B8%B2%E0%B8%87-02-scaled.jpg"
  },
  {
    "id": 5,
    "food_name": "ข้าวขาว",
    "food_carb": 1.0 ,
    "food_detail": "ทัพพี",
    "food_protein": 3.0,
    "food_proteindetail": "กรัม",
    "food_cal": 130.0,
    "food_caldetail": "กิโลแคลอรี่",
    "food_img":
        "https://www.thammculture.com/wp-content/uploads/2022/06/Untitled-221.jpg"
  },
   {
    "id": 6,
    "food_name": "ข้าวต้ม",
    "food_carb": 2.0 ,
    "food_detail": "ทัพพี",
    "food_protein": 1.4,
    "food_proteindetail": "กรัม",
    "food_cal": 40.7,
    "food_caldetail": "กิโลแคลอรี่",
    "food_img":
        "https://krua.co/wp-content/uploads/2021/10/RT1681_ImageBannerMobile_960x633_New_.jpg"
  },
   {
    "id": 7,
    "food_name": "ข้าวโพดสุก",
    "food_carb": 0.5 ,
    "food_detail": "ฝักใหญ่",
    "food_protein": 3.4,
    "food_proteindetail": "กรัม",
    "food_cal": 86.0,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "https://www.thaihealth.or.th/data/content/27259/cms/thaihealth_c_ijlprvxyz137.jpg"
  },
   {
    "id": 8,
    "food_name": "ข้าวโพดอ่อน",
    "food_carb": 3.0 ,
    "food_detail": "ทัพพี",
    "food_protein": 2.3,
    "food_proteindetail": "กรัม",
    "food_cal": 33.0,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "https://www.sgethai.com/wp-content/uploads/2022/05/2-13.jpg"
  },
   {
    "id": 9,
    "food_name": "ข้าวเหนียว",
    "food_carb": 0.5 ,
    "food_detail": "ทัพพี",
    "food_protein": 2.0,
    "food_proteindetail": "กรัม",
    "food_cal": 97.0,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "https://www.vichaiyut.com/wp-content/uploads/2020/10/shutterstock_69628912-696x464.jpg"
  },
   {
    "id": 10,
    "food_name": "แคนตาลูป",
    "food_carb": 6.0 ,
    "food_detail": "ชิ้นคำ",
    "food_protein": 0.8,
    "food_proteindetail": "กรัม",
    "food_cal": 33.7,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "https://res.cloudinary.com/dk0z4ums3/image/upload/v1661307138/attached_image_th/wholeandslicedofjapanesemelonshoneymelonorcantaloupecucumis.jpg"
  },
   {
    "id": 11,
    "food_name": "แครอท",
    "food_carb": 3.0 ,
    "food_detail": "ทัพพี",
    "food_protein": 0.9,
    "food_proteindetail": "กรัม",
    "food_cal": 41.3,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "https://s3.theasianparent.com/cdn-cgi/image/width=700,quality=95/tap-assets-prod/wp-content/uploads/sites/25/2021/04/carrotorange.jpg"
  },
   {
    "id": 12,
    "food_name": "ดอกกะหล่ำ",
    "food_carb": 3.0 ,
    "food_detail": "ทัพพี",
    "food_protein": 1.9,
    "food_proteindetail": "กรัม",
    "food_cal": 24.9,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "https://www.gourmetandcuisine.com/Images/articles/stories/story_x_1278detail.jpg"
  },
   {
    "id": 13,
    "food_name": "นมจืด",
    "food_carb": 1.0 ,
    "food_detail": "แก้ว",
    "food_protein": 3.4,
    "food_proteindetail": "กรัม",
    "food_cal": 42.3,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "https://samitivej-prod-new-website.s3.ap-southeast-1.amazonaws.com/public/uploads/descriptions/7f1443dab2cb5d4f276b83f1bcdcbed0.jpg"
  },
   {
    "id": 14,
    "food_name": "น้ำเชื่อม",
    "food_carb":  1.0,
    "food_detail": "ช้อนโต๊ะ",
    "food_protein": 0.0,
    "food_proteindetail": "กรัม",
    "food_cal": 24.4,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "https://www.pholfoodmafia.com/wp-content/uploads/2017/07/honey-sweet-syrup-organic.jpg"
  },
   {
    "id": 15,
    "food_name": "น้ำตาลทราย",
    "food_carb": 1.0 ,
    "food_detail": "ช้อนโต๊ะ",
    "food_protein": 0.12,
    "food_proteindetail": "กรัม",
    "food_cal": 17.0,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "https://kmc.exim.go.th/files/article/thumb/0d66aea11e4d1db68fdd3169cd686f3f.jpg"
  },
   {
    "id": 16,
    "food_name": "บร็อคโคลี่",
    "food_carb": 3.0 ,
    "food_detail": "ทัพพี",
    "food_protein": 11.0,
    "food_proteindetail": "กรัม",
    "food_cal": 33.7,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "https://www.pobpad.com/wp-content/uploads/2018/06/1727-%E0%B8%9A%E0%B8%A3%E0%B9%87%E0%B8%AD%E0%B8%84%E0%B9%82%E0%B8%84%E0%B8%A5%E0%B8%B5%E0%B9%88-rs.jpg"
  },
   {
    "id": 17,
    "food_name": "ฝรั่ง",
    "food_carb": 0.5 ,
    "food_detail": "ลูก",
    "food_protein": 2.6,
    "food_proteindetail": "กรัม",
    "food_cal": 68.1,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "https://cms.dmpcdn.com/food/2021/08/26/cdc7c450-0634-11ec-8147-2f4916a797d2_original.jpg"
  },
   {
    "id": 18,
    "food_name": "ฟักทองสุก",
    "food_carb": 1.0 ,
    "food_detail": "ทัพพี",
    "food_protein": 1.0,
    "food_proteindetail": "กรัม",
    "food_cal": 20.0,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "https://shopee.co.th/blog/wp-content/uploads/2021/03/%E0%B9%80%E0%B8%A1%E0%B8%99%E0%B8%B9%E0%B8%9F%E0%B8%B1%E0%B8%81%E0%B8%97%E0%B8%AD%E0%B8%87-1140x800.jpg"
  },
   {
    "id": 19,
    "food_name": "มะละกอ",
    "food_carb": 6.0 ,
    "food_detail": "ชิ้นคำ",
    "food_protein": 0.47,
    "food_proteindetail": "กรัม",
    "food_cal": 42.8,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "http://www.disthai.com/images/content/original-1651653975999.jpg"
  },
 {
    "id": 20,
    "food_name": "โยเกิร์ต",
    "food_carb": 1.0 ,
    "food_detail": "ถ้วย",
    "food_protein": 10.0,
    "food_proteindetail": "กรัม",
    "food_cal": 58.8,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "https://www.bigc.co.th/blog/wp-content/uploads/2022/05/avocado-avocado-yogurt-products-made-from-avocado-food-nutrition-concept.jpg"
  },
   {
    "id": 21,
    "food_name": "ลองกอง",
    "food_carb": 6.0 ,
    "food_detail": "ลูก",
    "food_protein": 0.9,
    "food_proteindetail": "มิลลิกรัม",
    "food_cal": 57.0,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "https://cdn-cakfh.nitrocdn.com/uCvbbthIGuqozYBVHNiffOSAfPDdhkkl/assets/static/optimized/rev-44279d4/kaset.today/wp-content/uploads/2021/03/767ce3e699d14935724ecaf596f93b9d.2-90.jpg"
  },
   {
    "id": 22,
    "food_name": "ลำไย",
    "food_carb": 6.0 ,
    "food_detail": "ลูก",
    "food_protein": 1.0,
    "food_proteindetail": "กรัม",
    "food_cal": 111.0,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "https://www.healthtodaythailand.in.th/wp-content/uploads/2017/11/Longan_1.jpg"
  },
   {
    "id": 23,
    "food_name": "ลิ้นจี่",
    "food_carb": 6.0 ,
    "food_detail": "ลูก",
    "food_protein": 0.8,
    "food_proteindetail": "กรัม",
    "food_cal": 66.0,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "https://s.isanook.com/wo/0/rp/r/w850/ya0xa0m1w0/aHR0cHM6Ly9zLmlzYW5vb2suY29tL3dvLzAvdWQvMzIvMTY0OTQ1L2xsLmpwZw==.jpg"
  },
   {
    "id": 24,
    "food_name": "ส้มเขียวหวาน",
    "food_carb": 1.0 ,
    "food_detail": "ลูก",
    "food_protein": 0.7,
    "food_proteindetail": "กรัม",
    "food_cal": 53.3,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "https://s.isanook.com/he/0/rp/r/w850/ya0xa0m1w0/aHR0cHM6Ly9zLmlzYW5vb2suY29tL2hlLzAvdWQvNi8zMjAyMS90YW5nZXJpbmUuanBn.jpg"
  },
   {
    "id": 25,
    "food_name": "สับปะรด",
    "food_carb": 6.0 ,
    "food_detail": "คำ",
    "food_protein": 0.5,
    "food_proteindetail": "กรัม",
    "food_cal": 50.0,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "https://www.pangpond.com/wp-content/uploads/%E0%B8%AA%E0%B8%B1%E0%B8%9B%E0%B8%A3%E0%B8%94.jpg"
  },
   {
    "id": 26,
    "food_name": "เส้นก๋วยเตี๋ยว(วุ้นเส้น)",
    "food_carb": 1.0 ,
    "food_detail": "ทัพพี",
    "food_protein": 2.0,
    "food_proteindetail": "กรัม",
    "food_cal": 40.0,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "https://www.cpbrandsite.com/contents/tips_tricks/fbpi6pbgedvmu1lafhx3ruilk8n7se5d6ngop6y0.png"
  },
   {
    "id": 27,
    "food_name": "เส้นก๋วยเตี๋ยว(เส้นบะหมี่)",
    "food_carb": 1.0 ,
    "food_detail": "ทัพพี",
    "food_protein": 4.5,
    "food_proteindetail": "กรัม",
    "food_cal": 280.0,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "https://img.kapook.com/u/surauch/cook1/BaMhee-1.jpg"
  },
   {
    "id": 28,
    "food_name": "เส้นก๋วยเตี๋ยว(เส้นเล็ก)",
    "food_carb": 1.0 ,
    "food_detail": "ทัพพี",
    "food_protein": 1.8,
    "food_proteindetail": "กรัม",
    "food_cal": 108.0,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "https://s3.theasianparent.com/cdn-cgi/image/width=700,quality=95/tap-assets-prod/wp-content/uploads/sites/25/2022/01/rice-noodle.jpg"
  },
   {
    "id": 29,
    "food_name": "เส้นก๋วยเตี๋ยว(เส้นหมี่)",
    "food_carb": 1.0 ,
    "food_detail": "ทัพพี",
    "food_protein": 7.0,
    "food_proteindetail": "กรัม",
    "food_cal": 370.0,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "https://img.wongnai.com/p/1920x0/2021/07/10/04672818b7c04db6a7b606e240cde904.jpg"
  },
   {
    "id": 30,
    "food_name": "เส้นก๋วยเตี๋ยว(เส้นใหญ่)",
    "food_carb": 1.0 ,
    "food_detail": "ทัพพี",
    "food_protein": 2.5,
    "food_proteindetail": "กรัม",
    "food_cal": 120.0,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "https://t1.blockdit.com/photos/2021/05/6097d7c8f931950c68356d1a_800x0xcover_K8VYhlc0.jpg"
  },
   {
    "id": 31,
    "food_name": "เส้นขนมจีน",
    "food_carb": 1.0 ,
    "food_detail": "ทัพพี",
    "food_protein": 0.9,
    "food_proteindetail": "กรัม",
    "food_cal": 77.0,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "https://s359.kapook.com/pagebuilder/01260069-813b-4aec-9899-e8da6876d993.jpg"
  },
   {
    "id": 32,
    "food_name": "แอปเปิ้ลเขียว",
    "food_carb": 1.0 ,
    "food_detail": "ลูก",
    "food_protein": 0.0,
    "food_proteindetail": "กรัม",
    "food_cal": 30.0,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "http://www.healthandtrend.com/wp-content/uploads/2017/02/Applene-3.jpg"
  },
   {
    "id": 33,
    "food_name": "แอปเปิ้ลลูกใหญ่",
    "food_carb": 0.5 ,
    "food_detail": "ลูก",
    "food_protein": 0.3,
    "food_proteindetail": "กรัม",
    "food_cal": 84.1,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
       "https://www.samunpri.com/wp-content/uploads/2018/12/Malus-domestica.jpg" 
        },
   {
    "id": 34,
    "food_name": "แก้วมังกร",
    "food_carb": 1 ,
    "food_detail": "ลูก",
    "food_protein": 2.0,
    "food_proteindetail": "กรัม",
    "food_cal": 66,
    "food_caldetail": "กิโลแคลโลรี",
    "food_img":
        "https://s.isanook.com/he/0/ud/2/13057/13057-thumbnail.jpg"
  },
  

  // "ข้าวสวย",
  // "ข้าวต้ม",
  // "ขนมปัง",
  // "นมจืด",
  // "โยเกิร์ต",
  // "แอปเปิ้ลเขียว",
  // "กล้วย",
  // "ข้าวขาว",
  // "ข้าวกล้อง",
  // "ข้าวเหนียว",
  // "เส้นก๋วยเตี๋ยว(เส้นบะหมี่)",
  // "เส้นก๋วยเตี๋ยว(เส้นหมี่)",
  // "เส้นก๋วยเตี๋ยว(เส้นเล็ก)",
  // "เส้นก๋วยเตี๋ยว(เส้นใหญ่)",
  // "เส้นก๋วยเตี๋ยว(วุ้นเส้น)",
  // "ฟักทองสุก",
  // "ข้าวโพดสุก",
  // "แครอท",
  // "บล็อคโคลี",
  // "ดอกกะหล่ำ",
  // "ข้าวโพดอ่อน",
  // "กล้วยน้ำว้า",
  // "ส้มเขียวหวาน",
  // "แอปเปิ้ลลูกใหญ่",
  // "แก้วมังกร",
  // "ฝรั่ง",
  // "แคนตาลูป",
  // "มะละกอ",
  // "สับปะรด",
  // "ลองกอง",
  // "ลำไย",
  // "ลิ้นจี่",
  // "นมจืด",
  // "น้ำตาลทราย",
  // "น้ำเชื่อม",
  // "แครอท",
  // "แครอท",
];
