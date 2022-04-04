// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:khalsana_app/style/colors.dart';
import '../shared/component/components.dart';

class DealsDashboard extends StatefulWidget {
  @override
  State<DealsDashboard> createState() => _DealsDashboardState();
}

class _DealsDashboardState extends State<DealsDashboard> {
  var searchController = TextEditingController();
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: customizedFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customizedNavBar(
        onItemTapped: onItemTapped,
        selectedIndex: selectedIndex,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            20.0,
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 22.0,
                ),

                // Title + Profile Pic.
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

                // Search Bar + Scanner
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

                // Top Deals Section
                customizedHeadline(data: "Top Deals"),
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

                // Medicines Section
                customizedHeadline(data: "Medicines"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      productItem(
                        borderColor: TextColor1,
                        productImage: 'images/med1.png',
                        productName: "Panadol Cold & Flu",
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      productItem(
                        borderColor: buttonColor2,
                        productImage: 'images/med1.png',
                        productName: "Panadol Cold & Flu",
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      productItem(
                        borderColor: TextColor1,
                        productImage: 'images/med1.png',
                        productName: "Panadol Cold & Flu",
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      productItem(
                        borderColor: buttonColor2,
                        productImage: 'images/med1.png',
                        productName: "Panadol Cold & Flu",
                      ),
                    ],
                  ),
                ),

                // Medical Equipment Section
                customizedHeadline(data: "Medical Equipment"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      productItem(
                        borderColor: TextColor1,
                        productImage: 'images/med1.png',
                        productName: "Panadol Cold & Flu",
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      productItem(
                        borderColor: buttonColor2,
                        productImage: 'images/med1.png',
                        productName: "Panadol Cold & Flu",
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      productItem(
                        borderColor: TextColor1,
                        productImage: 'images/med1.png',
                        productName: "Panadol Cold & Flu",
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      productItem(
                        borderColor: buttonColor2,
                        productImage: 'images/med1.png',
                        productName: "Panadol Cold & Flu",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
}
