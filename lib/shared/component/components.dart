import 'package:flutter/material.dart';

import '../../style/colors.dart';

Widget defaultTextForm({
  required var controller,
  required IconData prefixIcon,
  required String hint,
  required validate,
  bool isPassword = false,
  TextInputType keyboardType = TextInputType.text,
  IconData? suffixIcon,
  VoidCallback? suffixPressed,
}) =>
    TextFormField(
      textCapitalization: TextCapitalization.words,
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      validator: validate,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Color(0xffD7D7D7)),
        ),
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: IconButton(
          icon: Icon(suffixIcon),
          onPressed: suffixPressed,
        ),
        labelText: hint,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: buttonColor1),
        ),
      ),
    );

Widget defaultSearchBar() => Container(
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Color(0xffD7D7D7)),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(0),
          hintText: 'What are you looking for?',
          hintStyle: TextStyle(
            color: Color(0xffD7D7D7),
          ),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
