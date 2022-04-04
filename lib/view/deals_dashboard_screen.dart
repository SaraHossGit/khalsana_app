import 'package:flutter/material.dart';
import 'package:khalsana_app/style/colors.dart';

import '../shared/component/components.dart';

class DealsDashboardScreen extends StatelessWidget {
  const DealsDashboardScreen({Key? key}) : super(key: key);

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
              customizedHeader(title: "Deals Dashboard"),

              // Search Bar + Scanner
            ],
          ),
        ),
      ),
    );
  }
}
