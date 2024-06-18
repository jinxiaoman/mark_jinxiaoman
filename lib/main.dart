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
import 'package:mark_jinxiaoman/app/utils/logger.dart';
import 'package:mark_jinxiaoman/generated/locales.g.dart';
import 'package:oktoast/oktoast.dart';

void main() async {
  WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized(); // 确保Flutter框架初始化
  GlobalBinding().dependencies(); // 绑定全局依赖
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding); // 保留启动屏

  await _initializeApp(); // 初始化应用

  FlutterNativeSplash.remove(); // 移除启动屏
}

Future<void> _initializeApp() async {
  await AppData.initData(); // 初始化数据
  final locale = await AppData.getCurrentLocale(); // 获取当前语言
  final themeMode = await AppData.getThemeMode(); // 获取当前主题模式

  await Future.delayed(Duration(seconds: 1)); // 模拟启动屏幕停留时间

  runApp(MyApp(locale: locale, themeMode: themeMode)); // 运行应用
}

class MyApp extends StatelessWidget {
  final Locale locale;
  final ThemeMode themeMode;

  MyApp({required this.locale, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // 强制竖屏
      DeviceOrientation.portraitDown,
    ]);

    AppLogger.i("缓存中的国际化语言索引--,${locale}");
    AppLogger.i("缓存中的themeMode--,${themeMode}");

    return ScreenUtilInit(
      designSize: Size(375, 690), // 填入设计稿中设备的屏幕尺寸，单位dp
      builder: (context, child) {
        return OKToast(
          child: GetMaterialApp(
            enableLog: true,
            theme: CustomTheme.lightTheme,
            darkTheme: CustomTheme.darkTheme,
            themeMode: themeMode,
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            translationsKeys: AppTranslation.translations,
            locale: locale, // 当前的Locale
            fallbackLocale: Locale('en', 'US'), // 备用Locale
            supportedLocales: [
              Locale('en', 'US'),
              Locale('zh', 'CN'),
              // 添加其他Locale
            ],
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            builder: (context, widget) {
              Get.find<ToastService>().init(context);
              Get.find<LoadingService>().init(context);
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: TextScaler.linear(1.0)),
                child: widget ?? Container(),
              );
            },
          ),
        );
      },
    );
  }
}
