// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:khalsana_app/style/colors.dart';

import '../shared/component/components.dart';

class DealsDashboard extends StatefulWidget {
  @override
  State<DealsDashboard> createState() => _DealsDashboardState();
}

class _DealsDashboardState extends State<DealsDashboard> {
  var searchController = TextEditingController();
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_literals_to_create_immutables
    return Scaffold(
      floatingActionButton: Transform.rotate(
        angle: 40.05,
        child: FloatingActionButton(
          foregroundColor: backgroundColor, //Color of the "add" icon
          splashColor: buttonColor2, //Color when the icon is pressed
          onPressed: () {},
          child: Transform.rotate(
              angle: 40.05,
              child: const Icon(
                Icons.add,
                size: 35.0,
              )),
          backgroundColor: buttonColor1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: boxDecoration(),
        // margin: const EdgeInsets.all(12.0),
        child: ClipRRect(
          // borderRadius:
          // const BorderRadius.vertical(bottom: Radius.circular(25.0)),
          child: BottomNavigationBar(
            unselectedItemColor: buttonColor2.withOpacity(0.3),
            selectedItemColor: buttonColor2,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: 'Deals',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Reminders',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 22.0,
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "Deals Dashboard",
                    style: TextStyle(
                      color: TextColor1,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                  SizedBox(
                    width: 60.0,
                  ),
                  Expanded(
                    child: CircleAvatar(
                      radius: 25.0,
                      backgroundImage: AssetImage(
                        'images/user.png',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: defaultSearchBar(),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    Icons.camera_enhance_outlined,
                    color: TextColor1,
                    size: 38.0,
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              const Text(
                "Top Deals",
                style: TextStyle(
                  color: TextColor1,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 150.0,
                      height: 230.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: TextColor1,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 150.0,
                        height: 108.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFA69E),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Image(
                          height: 60.0,
                          image: AssetImage(
                            'images/med1.png',
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Container(
                        width: 150.0,
                        height: 108.0,
                        decoration: BoxDecoration(
                          color: buttonColor1,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: buttonColor2.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 12,
        ),
      ],
    );
  }
}
