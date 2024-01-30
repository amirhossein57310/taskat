import 'package:flutter/material.dart';
import 'package:taskat_apk/screens/calendar_screen.dart';
import 'package:taskat_apk/screens/home_screen.dart';
import 'package:taskat_apk/screens/setting_screen.dart';
import 'package:taskat_apk/screens/time_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int bottomNavodatorIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            bottomNavodatorIndex = index;
          });
        },
        currentIndex: bottomNavodatorIndex,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: SizedBox(
              width: 25,
              height: 27,
              child: Image.asset('assets/images/Settings.png'),
            ),
            activeIcon: SizedBox(
              width: 25,
              height: 27,
              child: Image.asset(
                'assets/images/Settings.png',
                color: Color(0xff18DAA3),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SizedBox(
              width: 25,
              height: 27,
              child: Image.asset('assets/images/Time.png'),
            ),
            activeIcon: SizedBox(
              width: 25,
              height: 27,
              child: Image.asset('assets/images/active-Time.png'),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SizedBox(
              width: 25,
              height: 27,
              child: Image.asset('assets/images/Calendar.png'),
            ),
            activeIcon: SizedBox(
              width: 25,
              height: 27,
              child: Image.asset('assets/images/active-Calendar.png'),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SizedBox(
              width: 25,
              height: 27,
              child: Image.asset('assets/images/Home.png'),
            ),
            activeIcon: SizedBox(
              width: 25,
              height: 27,
              child: Image.asset('assets/images/active-Home.png'),
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: bottomNavodatorIndex,
        children: getScreens(),
      ),
    );
  }
}

List<Widget> getScreens() {
  return const <Widget>[
    SettingScreen(),
    TimeScreen(),
    CalendarScreen(),
    HomeScreen(),
  ];
}
