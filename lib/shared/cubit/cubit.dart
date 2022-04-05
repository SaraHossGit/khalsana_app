// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khalsana_app/shared/cubit/cubit_states.dart';

import '../../view/deals_dashboard_screen.dart';
import '../../view/home_screen.dart';
import '../../view/profile_screen.dart';
import '../../view/reminder_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitState());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void navBarChanged(index) {
    currentIndex = index;
    emit(NavBarState());
  }
}
