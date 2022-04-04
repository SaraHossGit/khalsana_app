// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:khalsana_app/style/colors.dart';
import 'package:khalsana_app/view/profile_screen.dart';
import 'package:khalsana_app/view/reminder_screen.dart';
import '../shared/component/components.dart';
import 'deals_dashboard_screen.dart';
import 'home_screen.dart';

class NavigationPage extends StatefulWidget {
  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  var searchController = TextEditingController();
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    DealsDashboardScreen(),
    ReminderScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: customizedFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customizedNavBar(
        onItemTapped: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedIndex: currentIndex,
      ),
      body: screens[currentIndex],
    );
  }
}
