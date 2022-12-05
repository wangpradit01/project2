import 'package:baowan/alarm.dart';
import 'package:baowan/profile.dart';
import 'package:baowan/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuTap extends StatefulWidget {
  const MenuTap({Key? key}) : super(key: key);

  @override
  State<MenuTap> createState() => _MenuTapState();
}

class _MenuTapState extends State<MenuTap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: BottomNavigationBar1(),
    );
  }
}

class BottomNavigationBar1 extends StatefulWidget {
  const BottomNavigationBar1({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBar1> createState() => _BottomNavigationBar1State();
}

class _BottomNavigationBar1State extends State<BottomNavigationBar1> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xffffffff), Color(0xffffffff)])),
      child: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 63.06, right: 63.06, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBottomBar(
                      text: "หน้าหลัก",
                      icon: Icons.home_outlined,
                      selected: _selectedIndex == 0,
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        );
                      }),
                  IconBottomBar(
                      text: "เตือนความจำ",
                      icon: Icons.alarm,
                      selected: _selectedIndex == 1,
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Alarm()),
                        );
                      }),
                  IconBottomBar(
                      text: "ตั้งค่า",
                      icon: Icons.settings_outlined,
                      selected: _selectedIndex == 2,
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 2;
                        });
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Setting()),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  const IconBottomBar(
      {required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: onPressed,
                icon: Icon(icon,
                    size: 25, color: selected ? Colors.blue : Colors.blue)),
            Text(
              text,
              style: GoogleFonts.prompt(
                textStyle: TextStyle(
                  fontSize: 12,
                  height: 0.5,
                  color: selected ? Colors.blue : Colors.blue,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
