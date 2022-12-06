import 'package:baowan/Data/ProfileModel.dart';
import 'package:baowan/services/supabase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EditProfile extends StatefulWidget {
  final Profile data;
  const EditProfile({Key? key, required this.data}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isSelectedMale = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController birthController = TextEditingController();

  bool isUpdating = false;
  @override
  void initState() {
    emailController = TextEditingController(text: '${widget.data.email}');
    nameController = TextEditingController(text: '${widget.data.name}');
    birthController = TextEditingController(text: '${widget.data.birth}');
    setState(() {
      if (widget.data.gender == 0) {
        isSelectedMale = true;
      } else {
        isSelectedMale = false;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    birthController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 100,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          behavior: HitTestBehavior.translucent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'ย้อนกลับ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff757575),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        title: const Text(
          "แก้ไขโปรไฟล์",
          style: TextStyle(
              letterSpacing: .54,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xff2D2D2D)),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              setState(() {
                isUpdating = true;
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Please wait',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              });
              await SupabaseService.updateProfile(
                  name: nameController.text,
                  email: emailController.text,
                  isMale: isSelectedMale,
                  birth: DateTime.parse(birthController.text));
              setState(() {
                isUpdating = false;
                Navigator.pop(context);
              });
              Navigator.pop(context, true);
            },
            behavior: HitTestBehavior.translucent,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'บันทึก',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: false,
        children: [
          Container(
            height: 5,
            color: Color(0xffEFEFEF),
          ),
          SizedBox(
            height: 30,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 120,
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/image/woman3x.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'อีเมล',
                    style: TextStyle(
                      color: Color(0xff2D2D2D),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffD9D9D9),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'ชื่อ',
                    style: TextStyle(
                      color: Color(0xff2D2D2D),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffD9D9D9),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'วันเกิด',
                    style: TextStyle(
                      color: Color(0xff2D2D2D),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    child: TextFormField(
                      controller: birthController,
                      onTap: () async {
                        DateTime? birthDate = DateFormat("yyyy-MM-dd")
                            .parse(birthController.value.text);
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: birthDate,
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2101));
                        birthController.text =
                            DateFormat('yyyy-MM-dd').format(pickedDate!);
                      },
                      readOnly: true,
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.calendar_month),
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffD9D9D9),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'ชนิดเบาหวาน',
                    style: TextStyle(
                      color: Color(0xff2D2D2D),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF3F3F3),
                        border: Border.all(color: Color(0xffD9D9D9)),
                        borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              setState(() {
                                isSelectedMale = true;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              decoration: isSelectedMale
                                  ? BoxDecoration(
                                      border: Border.all(
                                          color: Colors.blue, width: 2),
                                      borderRadius: BorderRadius.circular(10))
                                  : null,
                              child: Text(
                                'ชาย',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: isSelectedMale
                                      ? Colors.blue
                                      : Color(0xff757575),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              setState(() {
                                isSelectedMale = false;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              decoration: !isSelectedMale
                                  ? BoxDecoration(
                                      border: Border.all(
                                          color: Colors.blue, width: 2),
                                      borderRadius: BorderRadius.circular(10))
                                  : null,
                              child: Text(
                                'หญิง',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: !isSelectedMale
                                      ? Colors.blue
                                      : Color(0xff757575),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }
}
