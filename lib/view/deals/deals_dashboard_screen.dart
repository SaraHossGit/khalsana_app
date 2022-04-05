// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:khalsana_app/style/colors.dart';
import 'package:khalsana_app/view/deals/add_deal.dart';

import '../../shared/component/components.dart';

class DealsDashboardScreen extends StatelessWidget {
  const DealsDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(
          20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Header
            customizedHeader(title: "Deals Dashboard"),

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

            //Deals List
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Users')
                      .doc('Data')
                      .collection('Deals')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: Color(0xff707070)
                                            .withOpacity(0.5))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 20.0),
                                  child: Column(
                                    children: [
                                      // Title + Profile Pic.
                                      Row(
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          CircleAvatar(
                                            radius: 25.0,
                                            backgroundImage: AssetImage(
                                              'images/user.png',
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.0,
                                          ),
                                          Text(
                                            'Sara Hossam',
                                            style: TextStyle(
                                              color: TextColor1,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),

                                      // Medic Data
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('${document.id}',
                                                    style: TextStyle(
                                                        fontSize: 25.0,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(
                                                  'Expiration Date: ${data['Date']}',
                                                  style:
                                                      TextStyle(fontSize: 16.0),
                                                ),
                                                Text(
                                                  'Quantity Available: ${data['Quantity']}',
                                                  style:
                                                      TextStyle(fontSize: 16.0),
                                                ),
                                                Text(
                                                  'Discounted Price: ${data['Price']} LE',
                                                  style:
                                                      TextStyle(fontSize: 16.0),
                                                ),
                                                Text(
                                                  'Notes: ${data['Notes']}',
                                                  style:
                                                      TextStyle(fontSize: 16.0),
                                                ),
                                              ],
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () async {
                                              // await deleteTestDrive(document.id);
                                            },
                                            icon: Icon(Icons.delete_forever),
                                            iconSize: 35.0,
                                            color: Color(0xffC90000),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  }),
            ),
          ],
        ),
      ),
    );

    // return Column(
    //   children: [
    //     Container(
    //       child: defaultSearchBar(),
    //     ),
    //     Expanded(
    //       child: StreamBuilder<QuerySnapshot>(
    //           stream: FirebaseFirestore.instance
    //               .collection('Users')
    //               .doc(FirebaseAuth.instance.currentUser!.uid)
    //               .collection('Deals')
    //               .snapshots(),
    //           builder: (BuildContext context,
    //               AsyncSnapshot<QuerySnapshot> snapshot) {
    //             if (!snapshot.hasData) {
    //               return Center(
    //                 child: CircularProgressIndicator(),
    //               );
    //             }

    //             return ListView(
    //               children:
    //                   snapshot.data!.docs.map((DocumentSnapshot document) {
    //                 Map<String, dynamic> data =
    //                     document.data() as Map<String, dynamic>;
    //                 return Padding(
    //                   padding: const EdgeInsets.all(20.0),
    //                   child: Column(
    //                     children: [
    //                       Container(
    //                         width: 420.0,
    //                         height: 280.0,
    //                         decoration: BoxDecoration(
    //                             color: Color(0xffEEEEEE),
    //                             borderRadius: BorderRadius.circular(10.0),
    //                             border: Border.all(color: Color(0xff707070))),
    //                         child: Padding(
    //                           padding: const EdgeInsets.symmetric(
    //                               horizontal: 20.0, vertical: 20.0),
    //                           child: Column(
    //                             children: [
    //                               Image(
    //                                 image: AssetImage('images/arrizo4.png'),
    //                                 width: 420.0,
    //                               ),
    //                               Row(
    //                                 children: [
    //                                   Expanded(
    //                                     child: Column(
    //                                       crossAxisAlignment:
    //                                           CrossAxisAlignment.start,
    //                                       children: [
    //                                         Text('${document.id}',
    //                                             style: TextStyle(
    //                                                 fontSize: 30.0,
    //                                                 fontWeight:
    //                                                     FontWeight.bold)),
    //                                         SizedBox(
    //                                           height: 10.0,
    //                                         ),
    //                                         Text('Date: ${data['Date']}'),
    //                                         Text('Time: ${data['Time']}'),
    //                                         Container(
    //                                           height: 25.0,
    //                                           width: 85.0,
    //                                           decoration: BoxDecoration(
    //                                             color: (data['Status'] ==
    //                                                     'Pending')
    //                                                 ? Color(0xff787878)
    //                                                 : ((data['Status'] ==
    //                                                         'Rejected')
    //                                                     ? Color(0xffC90000)
    //                                                     : Color(0xff28A745)),
    //                                             borderRadius:
    //                                                 BorderRadius.circular(10.0),
    //                                           ),
    //                                           child: Center(
    //                                             child: Text(
    //                                               '${data['Status']}',
    //                                               style: TextStyle(
    //                                                 fontSize: 15.0,
    //                                                 color: Colors.white,
    //                                               ),
    //                                             ),
    //                                           ),
    //                                         ),
    //                                       ],
    //                                     ),
    //                                   ),
    //                                   IconButton(
    //                                     onPressed: () async {
    //                                       // await deleteTestDrive(document.id);
    //                                     },
    //                                     icon: Icon(Icons.delete_forever),
    //                                     iconSize: 35.0,
    //                                     color: Color(0xffC90000),
    //                                   ),
    //                                 ],
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 );
    //               }).toList(),
    //             );
    //           }),
    //     ),
    //   ],
    // );
  }
}
