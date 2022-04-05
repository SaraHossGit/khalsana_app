// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khalsana_app/shared/cubit/bloc_observer.dart';
import 'package:khalsana_app/shared/cubit/cubit.dart';
import 'package:khalsana_app/shared/cubit/cubit_states.dart';
import 'package:khalsana_app/style/colors.dart';
import 'package:khalsana_app/view/login_screen.dart';

void main() {
  BlocOverrides.runZoned(

    () {
      runApp(MyApp());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: backgroundColor,
            primarySwatch: colorCustom,
            appBarTheme: AppBarTheme(
              backgroundColor: backgroundColor,
              elevation: 0.0,
            ),
          ),
          debugShowCheckedModeBanner: false,
          title: '5alsana',
          home: SplashScreen(),
        ),
      ),
    );
  }
}
