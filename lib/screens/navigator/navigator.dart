import 'package:daiday/screens/calendarPage/calendarPage.dart';
import 'package:daiday/screens/statisticsPage/statisticsPage.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../addPage/view/addPage.dart';
import '../mainPage/view/mainPage.dart';
import '../settingsPage/settingsPage.dart';

// Bottom Navigation bar changes screens with selectedIndex.
class MainNavigator extends StatefulWidget {
  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    MainPage(),
    CalendarPage(),
    AddPage(),
    BarChart(),
    SettingsPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        extendBody: true,
        bottomNavigationBar: NavigationBar(
          activeButtonFlexFactor: 100,
          inactiveButtonsFlexFactor: 100,
          activeIconColor: Colors.white,
          inactiveIconColor: Colors.grey,
          backgroundColor: Colors.black,
          backgroundOpacity: 0.7,
          selectedIndex: _selectedIndex,
          onTabChange: _onItemTapped,
          // showActiveButtonText: false,
          navigationBarButtons: const <NavigationBarButton>[
            NavigationBarButton(
              icon: Icons.home,
              backgroundColor: Colors.transparent,
            ),
            NavigationBarButton(
              icon: Icons.calendar_today,
              backgroundColor: Colors.transparent,
            ),
            NavigationBarButton(
              icon: Icons.dashboard,
              backgroundColor: Colors.transparent,
            ),
            NavigationBarButton(
              icon: Icons.equalizer,
              backgroundColor: Colors.transparent,
            ),
            NavigationBarButton(
              icon: Icons.more_horiz,
              backgroundColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
