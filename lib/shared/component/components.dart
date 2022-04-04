// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../style/colors.dart';

Widget customizedTextForm({
  required var controller,
  required IconData prefixIcon,
  required String hint,
  required validate,
  bool isPassword = false,
  TextInputType keyboardType = TextInputType.text,
  IconData? suffixIcon,
  VoidCallback? suffixPressed,
}) =>
    TextFormField(
      textCapitalization: TextCapitalization.words,
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      validator: validate,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Color(0xffD7D7D7)),
        ),
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: IconButton(
          icon: Icon(suffixIcon),
          onPressed: suffixPressed,
        ),
        labelText: hint,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: buttonColor1),
        ),
      ),
    );

Widget defaultSearchBar() => Container(
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Color(0xffD7D7D7)),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(0),
          hintText: 'What are you looking for?',
          hintStyle: TextStyle(
            color: Color(0xffD7D7D7),
          ),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );

Widget customizedNavBar({
  required var selectedIndex,
  required var onItemTapped,
}) =>
    Container(
      decoration: customizedBox(),
      child: ClipRRect(
        child: BottomNavigationBar(
          unselectedItemColor: buttonColor2.withOpacity(0.3),
          selectedItemColor: buttonColor2,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: onItemTapped,
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
        ),
      ),
    );

Widget customizedFloatingActionButton() => Transform.rotate(
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
    );

Widget customizedHeadline({
  required String data,
}) =>
    Column(children: [
      SizedBox(
        height: 15.0,
      ),
      Text(
        data,
        style: TextStyle(
          color: TextColor1,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
    ]);

Widget productItem({
  required Color borderColor,
  required String productImage,
  required String productName,
}) =>
    Container(
      width: 150.0,
      height: 135.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: borderColor,
          width: 3,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Image(
              height: 65.0,
              image: AssetImage(
                productImage,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              productName,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );

Widget customizedHeader({
  required String title,
}) =>
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 22.0,
      ),

      // Title + Profile Pic.
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            title,
            style: TextStyle(
              color: TextColor1,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          SizedBox(
            width: 60.0,
          ),
          CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage(
              'images/user.png',
            ),
          ),
        ],
      ),
      SizedBox(
        height: 20.0,
      ),
    ]);

BoxDecoration customizedBox() => BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(26.0),
      boxShadow: [
        BoxShadow(
          color: buttonColor2.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 7,
        ),
      ],
    );

Widget listItem() => Container(
      height: 85.0,
      width: double.infinity,
      decoration: customizedBox(),
      child: Padding(
        padding: const EdgeInsets.all(
          17.0,
        ),
        child: Row(
          children: [
            Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.0),
                color: Colors.teal,
              ),
            ),
            SizedBox(
              width: 18.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Antibiotic',
                    style: TextStyle(
                      color: TextColor1,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    'everyday at 6:00 PM',
                    style: TextStyle(
                      color: TextColor1,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            Checkbox(value: false, onChanged: (value) {}),
          ],
        ),
      ),
    );
