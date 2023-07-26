import 'package:flutter/material.dart';
import 'package:tradechat/configs/themes/theme_config.dart';

const style = TextStyle(
    fontFamily: ThemeConfig.pubicSansRegular,
    fontSize: 14,
    color: ThemeConfig.blackColorHard);

ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: ThemeData.light().textTheme.copyWith(
          displayLarge: style.copyWith(
              fontSize: 14, fontFamily: ThemeConfig.pubicSansBold),
          displayMedium: style.copyWith(),
          displaySmall: style.copyWith(),
          titleLarge: style.copyWith(
              fontSize: 22, fontFamily: ThemeConfig.pubicSansBold),
          titleMedium: style.copyWith(),
          titleSmall: style.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: style.copyWith(),
          bodySmall: style.copyWith(),
          bodyLarge: const TextStyle(fontSize: 14, color: Colors.black),
          labelSmall: style.copyWith(
              fontSize: 14, fontFamily: ThemeConfig.pubicSansMedium),
          labelMedium: style.copyWith(),
          labelLarge: style.copyWith(),
        ),
    iconTheme: const IconThemeData(color: ThemeConfig.primaryColor),
    primaryIconTheme: const IconThemeData(color: ThemeConfig.primaryColor),
    primaryColor: ThemeConfig.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme:
        const AppBarTheme(iconTheme: IconThemeData(color: Colors.black)),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 17, horizontal: 14.5),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2.0),
        borderSide: const BorderSide(
          color: ThemeConfig.borderColor,
          width: 1.2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2.0),
        borderSide: const BorderSide(
          color: ThemeConfig.primaryColor,
          width: 1.2,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: 4,
            shadowColor: Colors.black,
            padding: EdgeInsets.zero,
            backgroundColor: ThemeConfig.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)))),
    colorScheme: ThemeData.light()
        .colorScheme
        .copyWith(background: const Color.fromRGBO(235, 235, 235, 1)));
