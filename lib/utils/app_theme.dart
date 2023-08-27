import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_constants.dart';
import 'app_services.dart';

class AppTheme {
  static ThemeData lightTheme() => ThemeData(
        buttonTheme: const ButtonThemeData(
          buttonColor: AppColors.colorPrimaryBlue,
        ),
        primaryColor: AppColors.colorPrimaryBlue,
        scaffoldBackgroundColor: AppColors.colorSnowWhite,
        cardTheme: const CardTheme(elevation: 2, color: Colors.white),
        appBarTheme: AppBarTheme(
            color: AppColors.colorSnowWhite,
            elevation: 0.0,
            centerTitle: false,
            titleTextStyle: GoogleFonts.lato(
              textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
            )),
        textTheme: GoogleFonts.latoTextTheme(TextTheme(
          displayLarge: TextStyle(
              fontSize: AppServices.getDeviceType() == DeviceType.mobile
                  ? 22.0
                  : AppServices.getDeviceType() == DeviceType.smallTablet
                      ? 22.0
                      : 22.0,
              fontWeight: FontWeight.w400,
              color: Colors.black),
          displayMedium: TextStyle(
              fontSize: AppServices.getDeviceType() == DeviceType.mobile
                  ? 20.0
                  : AppServices.getDeviceType() == DeviceType.smallTablet
                      ? 20.0
                      : 20.0,
              fontWeight: FontWeight.w400,
              color: Colors.black),
          displaySmall: TextStyle(
              fontSize: AppServices.getDeviceType() == DeviceType.mobile
                  ? 18.0
                  : AppServices.getDeviceType() == DeviceType.smallTablet
                      ? 18.0
                      : 18.0,
              fontWeight: FontWeight.w400,
              color: Colors.black),
          headlineMedium: TextStyle(
              fontSize: AppServices.getDeviceType() == DeviceType.mobile
                  ? 16.0
                  : AppServices.getDeviceType() == DeviceType.smallTablet
                      ? 16.0
                      : 16.0,
              fontWeight: FontWeight.w400,
              color: Colors.black),
          headlineSmall: TextStyle(
              fontSize: AppServices.getDeviceType() == DeviceType.mobile
                  ? 14.0
                  : AppServices.getDeviceType() == DeviceType.smallTablet
                      ? 14.0
                      : 14.0,
              fontWeight: FontWeight.w400,
              color: Colors.black),
          titleLarge: TextStyle(
              fontSize: AppServices.getDeviceType() == DeviceType.mobile
                  ? 12.0
                  : AppServices.getDeviceType() == DeviceType.smallTablet
                      ? 12.0
                      : 12.0,
              fontWeight: FontWeight.w400,
              color: Colors.black),
          bodyLarge: TextStyle(
              fontSize: AppServices.getDeviceType() == DeviceType.mobile
                  ? 16.0
                  : AppServices.getDeviceType() == DeviceType.smallTablet
                      ? 16.0
                      : 16.0,
              fontWeight: FontWeight.w400,
              color: Colors.black),
          bodyMedium: TextStyle(
              fontSize: AppServices.getDeviceType() == DeviceType.mobile
                  ? 14.0
                  : AppServices.getDeviceType() == DeviceType.smallTablet
                      ? 14.0
                      : 14.0,
              fontWeight: FontWeight.w400,
              color: Colors.black),
          titleMedium: TextStyle(
              fontSize: AppServices.getDeviceType() == DeviceType.mobile
                  ? 12.0
                  : AppServices.getDeviceType() == DeviceType.smallTablet
                      ? 12.0
                      : 12.0,
              fontWeight: FontWeight.w400,
              color: Colors.black),
          titleSmall: TextStyle(
              fontSize: AppServices.getDeviceType() == DeviceType.mobile
                  ? 10.0
                  : AppServices.getDeviceType() == DeviceType.smallTablet
                      ? 10.0
                      : 10.0,
              fontWeight: FontWeight.w400,
              color: Colors.black),
          bodySmall: TextStyle(
              fontSize: AppServices.getDeviceType() == DeviceType.mobile
                  ? 12.0
                  : AppServices.getDeviceType() == DeviceType.smallTablet
                      ? 12.0
                      : 12.0,
              fontWeight: FontWeight.w400,
              color: Colors.black),
        )),
      );
}
