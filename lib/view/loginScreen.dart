// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:khalsana_app/view/registerScreen.dart';

import '../shared/component/components.dart';
import '../style/colors.dart';
import 'dealsDashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Image(
        image: AssetImage(
          'images/5alsana.png',
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPassword = true;
  IconData suffix = Icons.remove_red_eye;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image(
                    image: AssetImage(
                      'images/5alsana.png',
                    ),
                  ),
                  // Text(
                  //   'LOGIN',
                  //   style: TextStyle(
                  //     fontSize: 20.0,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: defaultTextForm(
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Email must not be empty';
                        }
                      },
                      controller: emailController,
                      prefixIcon: Icons.mail,
                      hint: 'Email Address',
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: defaultTextForm(
                      controller: passwordController,
                      hint: 'Password',
                      prefixIcon: Icons.lock,
                      suffixIcon: suffix,
                      isPassword: isPassword,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Password is too short';
                        }
                      },
                      suffixPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                          suffix = isPassword
                              ? Icons.visibility_off_sharp
                              : Icons.remove_red_eye;
                        });
                      },
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // child: state is LoginLoadingState? Center(child: CircularProgressIndicator(),):
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: buttonColor1,
                      ),
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print(emailController.text);
                            print(passwordController.text);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DealsDashboard()));
                          }
                        },
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                        },
                        child: Text(
                          'Register now',
                          style: TextStyle(
                            color: buttonColor1,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
