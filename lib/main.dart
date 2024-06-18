// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import 'app/routes/app_pages.dart';

// void main() {
//   runApp(
//     GetMaterialApp(
//       title: "Application",
//       initialRoute: AppPages.INITIAL,
//       getPages: AppPages.routes,
//     ),
//   );
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:mark_jinxiaoman/app/bindings/global_binding.dart';
import 'package:mark_jinxiaoman/app/data/app_data.dart';
import 'package:mark_jinxiaoman/app/data/loading_service.dart';
import 'package:mark_jinxiaoman/app/data/toast_service.dart';
import 'package:mark_jinxiaoman/app/routes/app_pages.dart';
import 'package:mark_jinxiaoman/app/ui/theme.dart';
import 'package:mark_jinxiaoman/app/utils/intl.dart';
import 'package:mark_jinxiaoman/app/utils/logger.dart';
import 'package:oktoast/oktoast.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GlobalBinding().dependencies();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
  _initializeApp();
}

///做一些初始化操作
void _initializeApp() async {
  await AppData.initData();
  await Future.delayed(Duration(seconds: 2)); // 模拟启动屏幕停留时间
// 权限路由
//   if (AppData.isFirstEntry()) {
//     Get.offAllNamed('/login'); // 第一次进入应用，跳转到登录页
//   } else if (AppData.isUserLoggedIn()) {
//     Get.offAllNamed('/home'); // 已登录，跳转到首页
//   } else {
//     Get.offAllNamed('/login'); // 未登录，跳转到登录页
//   }

  FlutterNativeSplash.remove();
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, //强制竖屏
      DeviceOrientation.portraitDown
    ]);
    // 获取缓存中的国际化语言索引
    int localeIndex = AppData.queryLocaleIndex();
    // 获取缓存中的主题模式
    ThemeMode themeMode = AppData.getThemeMode();
    AppLogger.i("缓存中的国际化语言索引--,${Intl().locales[localeIndex]}");
    AppLogger.i("缓存中的themeMode--,${themeMode}");
    return ScreenUtilInit(
        designSize: Size(375, 690), // 填入设计稿中设备的屏幕尺寸，单位dp
        builder: (context, child) {
          return OKToast(
              child: GetMaterialApp(
            translations: Intl(),
            enableLog: true,
            theme: CustomTheme.lightTheme,
            darkTheme: CustomTheme.darkTheme,
            themeMode: themeMode,
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            locale: Intl().locales[localeIndex],
            fallbackLocale: Intl().locales[localeIndex],

            ///添加一个默认语言选项，以备上面指定的语言翻译 不存在
            supportedLocales: Intl().locales,
            localizationsDelegates: [
              // S.delegate,
              GlobalMaterialLocalizations.delegate,

              /// 指定本地化的字符串和一些其他的值
              GlobalCupertinoLocalizations.delegate,

              /// 对应的Cupertino风格
              GlobalWidgetsLocalizations.delegate,

              /// 指定默认的文本排列方向, 由左到右或由右到左
            ],
            //   themeMode: ThemeMode.dark, // 设置主题模式
            builder: (context, widget) {
              Get.find<ToastService>().init(context);
              Get.find<LoadingService>().init(context);

              return MediaQuery(

                  ///设置文字大小不随系统设置改变
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: TextScaler.linear(1.0)),
                  child: widget ?? Container());
            },
          ));
        });
  }
}
