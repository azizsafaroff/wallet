import 'dart:io';

import 'package:exam_project/constants.dart';
import 'package:exam_project/database/database_helper.dart';
import 'package:exam_project/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Variables {
  // For screen controll :
  int currentScreenIndex = 0;

  File? imageAvatar;

  final List<Widget> screens = [
    HomeScreen()
  ];

  DatabaseHelper? database;
  FirebaseAuth? authUser;
  FirebaseApp? initializeFirebase;

  // For theme controll :
  String _themeMode = 'dark';

  // Colors :
  Color kPrimaryColor = kDarkPrimaryColor;
  Color kPrimaryLightColor = kDarkPrimaryLightColor;
  Color kTextColor = kDarkTextColor;

  // For change theme COlors :
  void changeTheme() {
    if (_themeMode == 'light') {
      kPrimaryColor = kDarkPrimaryColor;
      kPrimaryLightColor = kDarkPrimaryLightColor;
      kTextColor = kDarkTextColor;
      _themeMode = 'dark';
    } else if (_themeMode == 'dark'){
      kPrimaryColor = kLightPrimaryColor;
      kPrimaryLightColor = kLightPrimaryLightColor;
      kTextColor = kLightTextColor;
      _themeMode = 'light';
    }
  }
}
