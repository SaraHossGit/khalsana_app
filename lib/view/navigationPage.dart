// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khalsana_app/style/colors.dart';
import 'package:khalsana_app/view/profile_screen.dart';
import 'package:khalsana_app/view/reminder_screen.dart';
import '../shared/component/components.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/cubit_states.dart';
import 'deals_dashboard_screen.dart';
import 'home_screen.dart';

class NavigationPage extends StatelessWidget {
  var searchController = TextEditingController();
  List<Widget> screens = [
    HomeScreen(),
    DealsDashboardScreen(),
    ReminderScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) => Scaffold(
            floatingActionButton: customizedFloatingActionButton(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: customizedNavBar(
              onItemTapped: (index) {
                AppCubit.get(context).navBarChanged(index);
              },
              selectedIndex: AppCubit.get(context).currentIndex,
            ),
            body: screens[AppCubit.get(context).currentIndex],
          ),
        ));
  }
}
