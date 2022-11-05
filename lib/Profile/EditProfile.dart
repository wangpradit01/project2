import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EditProfile extends StatefulWidget {
  final data;
  const EditProfile({Key? key, required this.data}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isSelectedMale = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  @override
  void initState() {
    emailController = TextEditingController(text: '${widget.data['email']}');
    nameController = TextEditingController(text: '${widget.data['name']}');
    surnameController =
        TextEditingController(text: '${widget.data['surname']}');
    birthController = TextEditingController(text: '${widget.data['birth']}');
    genderController = TextEditingController(text: '${widget.data['gender']}');
    typeController = TextEditingController(text: '${widget.data['type']}');
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    surnameController.dispose();
    birthController.dispose();
    genderController.dispose();
    typeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 80,
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
                  fontSize: 12,
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
            onTap: () => Navigator.pop(context, {
              "name": "${nameController.value.text}",
              "surname": "${surnameController.value.text}",
              "email": "${emailController.value.text}",
              "birth": "${birthController.value.text}",
              "gender": "${genderController.value.text}",
              "type": "${typeController.value.text}"
            }),
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
                      fontSize: 12,
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
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => null,
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          'https://i.ytimg.com/vi/IcXmB23SsZg/maxresdefault.jpg',
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: Colors.blue, shape: BoxShape.circle),
                            child: Icon(
                              Icons.photo_camera,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        )
                      ],
                    ),
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
                    'นามสกุล',
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
                      controller: surnameController,
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
                        DateTime? birthDate = DateFormat("dd/MM/yyyy")
                            .parse(birthController.value.text);
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: birthDate,
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2101));
                        birthController.text =
                            DateFormat('dd/MM/yyyy').format(pickedDate!);
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
                                genderController.text = 'ชาย';
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
                                genderController.text = 'หญิง';
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
                        borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    child: TextFormField(
                      controller: typeController,
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
