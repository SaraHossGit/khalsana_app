// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:khalsana_app/view/register_screen.dart';

import '../shared/component/components.dart';
import '../style/colors.dart';
import 'navigationPage.dart';

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
  IconData suffix = Icons.visibility_off_sharp;
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
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: customizedTextForm(
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
                    child: customizedTextForm(
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: buttonColor1,
                    ),
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          var result = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text);

                          if (result != null) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NavigationPage()));
                          } else {
                            print('user not found');
                          }
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
