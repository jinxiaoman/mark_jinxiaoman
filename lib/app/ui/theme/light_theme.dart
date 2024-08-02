import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'theme_config.dart';

class LightTheme {
  static ThemeData get theme => ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: ThemeConfig.lightPrimary,
          onPrimary: ThemeConfig.lightOnPrimary,
          primaryContainer: ThemeConfig.lightPrimaryContainer,
          onPrimaryContainer: ThemeConfig.lightOnPrimaryContainer,
          secondary: ThemeConfig.lightSecondary,
          onSecondary: ThemeConfig.lightOnSecondary,
          secondaryContainer: ThemeConfig.lightSecondaryContainer,
          onSecondaryContainer: ThemeConfig.lightOnSecondaryContainer,
          error: ThemeConfig.lightError,
          onError: ThemeConfig.lightOnError,
          surface: ThemeConfig.lightSurface,
          onSurface: ThemeConfig.lightOnSurface,
        ),
        scaffoldBackgroundColor: ThemeConfig.lightScaffoldBackground,
        useMaterial3: true,
        fontFamily: ThemeConfig.lightThemeFont,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: ThemeConfig.lightOnSurface),
          bodyMedium: TextStyle(color: ThemeConfig.lightOnSurface),
          displayLarge: TextStyle(color: ThemeConfig.lightOnSurface),
          displayMedium: TextStyle(color: ThemeConfig.lightOnSurface),
          labelLarge: TextStyle(color: ThemeConfig.lightOnSurface),
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: ThemeConfig.white,
          scrolledUnderElevation: 0,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: ThemeConfig.black,
            fontSize: 23,
          ),
          iconTheme: IconThemeData(color: ThemeConfig.lightPrimary),
          elevation: 0,
          actionsIconTheme: IconThemeData(color: ThemeConfig.lightPrimary),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ThemeConfig.white,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: ThemeConfig.lightPrimary,
          unselectedItemColor: Colors.grey,
          backgroundColor: ThemeConfig.white,
        ),
      );
}
