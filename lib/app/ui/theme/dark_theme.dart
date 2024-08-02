import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'theme_config.dart';

class DarkTheme {
  static ThemeData get theme => ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: ThemeConfig.darkPrimary,
          onPrimary: ThemeConfig.darkOnPrimary,
          primaryContainer: ThemeConfig.darkPrimaryContainer,
          onPrimaryContainer: ThemeConfig.darkOnPrimaryContainer,
          secondary: ThemeConfig.darkSecondary,
          onSecondary: ThemeConfig.darkOnSecondary,
          secondaryContainer: ThemeConfig.darkSecondaryContainer,
          onSecondaryContainer: ThemeConfig.darkOnSecondaryContainer,
          error: ThemeConfig.darkError,
          onError: ThemeConfig.darkOnError,
          surface: ThemeConfig.darkSurface,
          onSurface: ThemeConfig.darkOnSurface,
        ),
        scaffoldBackgroundColor: ThemeConfig.darkScaffoldBackground,
        useMaterial3: true,
        fontFamily: ThemeConfig.darkThemeFont,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: ThemeConfig.darkOnSurface),
          bodyMedium: TextStyle(color: ThemeConfig.darkOnSurface),
          displayLarge: TextStyle(color: ThemeConfig.darkOnSurface),
          displayMedium: TextStyle(color: ThemeConfig.darkOnSurface),
          labelLarge: TextStyle(color: ThemeConfig.darkOnSurface),
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: ThemeConfig.black,
          scrolledUnderElevation: 0,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: ThemeConfig.white,
            fontSize: 23,
          ),
          iconTheme: IconThemeData(color: ThemeConfig.darkPrimary),
          elevation: 0,
          actionsIconTheme: IconThemeData(color: ThemeConfig.darkPrimary),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ThemeConfig.black,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.grey,
          backgroundColor: ThemeConfig.black,
        ),
      );
}
