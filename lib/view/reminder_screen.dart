import 'package:flutter/material.dart';

import '../shared/component/components.dart';

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(
          20.0,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Header
              customizedHeader(title: "Your Reminders"),

              // Search Bar + Scanner
            ],
          ),
        ),
      ),
    );
  }
}
