// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:khalsana_app/style/colors.dart';

import '../../shared/component/components.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({Key? key}) : super(key: key);

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  bool isToday = true;

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
            customizedHeader(title: "Your Reminders"),

            // Top Nav
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isToday = true;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40.0,
                      color: !isToday
                          ? Colors.white
                          : backgroundColor2.withOpacity(0.5),
                      child: const Text(
                        'Today',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: TextColor1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isToday = false;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40.0,
                      color: isToday
                          ? Colors.white
                          : backgroundColor2.withOpacity(0.5),
                      child: const Text(
                        'Upcomming',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: TextColor1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),

            //List
            Expanded(
              child: isToday
                  ? Center(
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Image(
                            image: AssetImage('images/noReminders.png'),
                            height: 200.0,
                            width: 200.0,
                          ),
                          Text(
                            'You have no reminders for Today',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: TextColor1,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: listItem(changedMethod: (val) {
                          setState(() {});
                        }),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 30.0,
                      ),
                      itemCount: 10,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
