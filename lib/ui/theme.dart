import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluish = Color(0xFF4e5ae8);
const Color yellowish = Color(0xFFFFB746);
const Color reddish = Color(0xFFff5667);
const Color colorPrimary = bluish;
const Color white = Colors.white;
const Color darkGrey = Color(0xFF121212);
const Color darkHeader = Color(0xFF424242);
const Color darkAccent = Colors.amberAccent;

class Themes {
  static final lightTheme = ThemeData(
      primaryColor: colorPrimary,
      backgroundColor: white,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        toolbarHeight: 72,
        elevation: 0,
        backgroundColor: white,
        iconTheme: IconThemeData(color: darkGrey),
      ),
      inputDecorationTheme: InputDecorationTheme(
        suffixIconColor: colorPrimary,
        prefixIconColor: colorPrimary,
        hintStyle: unselectedStyle,
        labelStyle: subtitleStyle,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.black26)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: colorPrimary)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: reddish)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.grey.shade400)),
      ));
  static final darkTheme = ThemeData(
      primaryColor: darkAccent,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkGrey,
      appBarTheme: const AppBarTheme(
        toolbarHeight: 72,
        elevation: 0,
        backgroundColor: darkGrey,
        iconTheme: IconThemeData(color: white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: unselectedStyle,
        labelStyle: subtitleStyle,
        suffixIconColor: darkAccent,
        prefixIconColor: darkAccent,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.white24)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: darkAccent)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: reddish)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.grey.shade300)),
      ));
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode
        ? Colors.white.withOpacity(0.6)
        : Colors.black.withOpacity(0.6),
  ));
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? Colors.white : Colors.black,
  ));
}

TextStyle get buttonStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 16,
    color: Get.isDarkMode ? Colors.black : Colors.white,
  ));
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Get.isDarkMode ? Colors.white : Colors.black,
  ));
}

TextStyle get subtitleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Get.isDarkMode ? Colors.white : Colors.black,
  ));
}

TextStyle get unselectedStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Get.isDarkMode
        ? Colors.white.withOpacity(0.5)
        : Colors.black.withOpacity(0.5),
  ));
}
