// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:khalsana_app/style/colors.dart';

import '../shared/component/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(
          20.0,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Header
              customizedHeader(title: "Home"),

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
    );
  }
}
