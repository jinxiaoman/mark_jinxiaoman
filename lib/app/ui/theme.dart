import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// theme.dart

class CustomTheme {
  static const lightThemeFont = "Inter", darkThemeFont = "Poppins";

  // 定义通用颜色
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  // light theme
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff1565c0),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff90caf9),
      onPrimaryContainer: Color(0xff0c1114),
      secondary: Color(0xff0277bd),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffbedcff),
      onSecondaryContainer: Color(0xff101214),
      error: Color(0xffb00020),
      onError: Color(0xffffffff),
      surface: Color(0xfff8fafd),
      onSurface: Color(0xff090909),
    ),
    scaffoldBackgroundColor: Color(0xFFF2F2F3),
    useMaterial3: true,
    fontFamily: lightThemeFont,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Color(0xff090909)),
      bodyMedium: TextStyle(color: Color(0xff090909)),
      displayLarge: TextStyle(color: Color(0xff090909)),
      displayMedium: TextStyle(color: Color(0xff090909)),
      labelLarge: TextStyle(color: Color(0xff090909)),
      // 其他文本样式
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: white,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: black,
        fontSize: 23,
      ),
      iconTheme: IconThemeData(color: Color(0xff1565c0)),
      elevation: 0,
      actionsIconTheme: IconThemeData(color: Color(0xff1565c0)),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: white,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Color(0xff1565c0),
      unselectedItemColor: Colors.grey,
      backgroundColor: white,
    ),
  );

  // dark theme
  static final darkTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff90caf9),
      onPrimary: Color(0xff0f1314),
      primaryContainer: Color(0xff0d47a1),
      onPrimaryContainer: Color(0xffe1eaf9),
      secondary: Color(0xffe1f5fe),
      onSecondary: Color(0xff141414),
      secondaryContainer: Color(0xff1a567d),
      onSecondaryContainer: Color(0xffe3edf3),
      error: Color(0xffcf6679),
      onError: Color(0xff140c0d),
      surface: Color(0xff171a1c),
      onSurface: Color(0xffeceded),
    ),
    scaffoldBackgroundColor: black,
    useMaterial3: true,
    fontFamily: darkThemeFont,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Color(0xffeceded)),
      bodyMedium: TextStyle(color: Color(0xffeceded)),
      displayLarge: TextStyle(color: Color(0xffeceded)),
      displayMedium: TextStyle(color: Color(0xffeceded)),
      labelLarge: TextStyle(color: Color(0xffeceded)),
      // 其他文本样式
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: black,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: white,
        fontSize: 23,
      ),
      iconTheme: IconThemeData(color: Color(0xff90caf9)),
      elevation: 0,
      actionsIconTheme: IconThemeData(color: Color(0xff90caf9)),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: black,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.grey,
      backgroundColor: black,
    ),
  );
}
