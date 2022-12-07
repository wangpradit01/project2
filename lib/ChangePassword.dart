import 'package:baowan/services/supabase_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController newController = TextEditingController();
  TextEditingController againController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เปลี่ยนรหัสผ่าน'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'รหัสผ่านใหม่',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: newController,
              obscureText: true,
              onTap: () {
                newController.clear();
              },
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Color(0xffD9D9D9),
                    ),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'รหัสผ่านใหม่อีกครั้ง',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: againController,
              obscureText: true,
              onTap: () {
                againController.clear();
              },
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Color(0xffD9D9D9),
                    ),
                  )),
            ),
            Expanded(child: Container()),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () async {
                if (newController.text != againController.text) {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('ไม่สำเร็จ'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: const <Widget>[
                              Text('รหัสผ่านไม่ตรงกัน กรุณากรอกใหม่อีกครั้ง'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('ปิด'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                  return;
                } else {
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
                  await SupabaseService.changePassword(newController.text);
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
              },
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue),
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'ตกลง',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
