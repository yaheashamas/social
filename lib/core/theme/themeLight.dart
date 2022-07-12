import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social/core/style/colors.dart';

const kDarkGrayColor = Color.fromRGBO(112, 112, 112, 1);
const kBlackColor = Color.fromRGBO(25, 25, 25, 1);
const kPrimaryColor = Color.fromRGBO(10, 102, 194, 1);

ThemeData themeLight = ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: "NSWAC",
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontFamily: "NSWAC",
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 50.0,
  ),
  textTheme: const TextTheme(
    titleSmall: TextStyle(
      fontSize: 10.0,
      color: kDarkGrayColor,
    ),
    //normal size text 12 14 16 18
    titleMedium: TextStyle(
      fontSize: 12.0,
      color: kBlackColor,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      color: kBlackColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: kBlackColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      color: kBlackColor,
    ),
    //big size with border 20 26 32
    headlineSmall: TextStyle(
      fontSize: 20.0,
      color: kBlackColor,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      fontSize: 26.0,
      color: kBlackColor,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: TextStyle(
      fontSize: 32.0,
      color: kBlackColor,
      fontWeight: FontWeight.bold,
    ),
    //with primary color 14 16 18
    displaySmall: TextStyle(
      fontSize: 14,
      color: kPrimaryColor,
    ),
    displayMedium: TextStyle(
      fontSize: 16,
      color: kPrimaryColor,
    ),
    displayLarge: TextStyle(
      fontSize: 18,
      color: kPrimaryColor,
    ),
  ),
);
