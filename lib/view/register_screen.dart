// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khalsana_app/style/colors.dart';
import 'package:khalsana_app/view/login_screen.dart';

import '../shared/component/components.dart';
import 'navigationPage.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                    // child: state is LoginLoadingState? Center(child: CircularProgressIndicator(),):
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: buttonColor1,
                      ),
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            try {
                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .createUserWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                print('The password provided is too weak.');
                              } else if (e.code == 'email-already-in-use') {
                                print(
                                    'The account already exists for that email.');
                              }
                            } catch (e) {
                              print(e);
                            }

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          }
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
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
