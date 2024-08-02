# Flutter GetX Project

## 项目结构
```
.
├── app
│   ├── bindings
│   │   └── global_binding.dart
│   ├── controllers
│   │   └── global_controller.dart
│   ├── data
│   │   ├── app_data.dart
│   │   ├── global_state.dart
│   │   ├── loading_service.dart
│   │   └── toast_service.dart
│   ├── modules
│   │   ├── about
│   │   │   ├── about_binding.dart
│   │   │   ├── about_controller.dart
│   │   │   └── about_view.dart
│   │   ├── dynamic
│   │   │   ├── dynamic_binding.dart
│   │   │   ├── dynamic_controller.dart
│   │   │   └── dynamic_view.dart
│   │   ├── home
│   │   │   ├── home_binding.dart
│   │   │   ├── home_controller.dart
│   │   │   └── home_view.dart
│   │   ├── login
│   │   │   ├── login_binding.dart
│   │   │   ├── login_controller.dart
│   │   │   └── login_view.dart
│   │   ├── policy
│   │   │   ├── modules
│   │   │   │   ├── privacy
│   │   │   │   │   ├── privacy_binding.dart
│   │   │   │   │   ├── privacy_controller.dart
│   │   │   │   │   └── privacy_view.dart
│   │   │   │   └── user
│   │   │   │       ├── user_binding.dart
│   │   │   │       ├── user_controller.dart
│   │   │   │       └── user_view.dart
│   │   │   ├── policy_binding.dart
│   │   │   ├── policy_controller.dart
│   │   │   └── policy_view.dart
│   │   ├── profile
│   │   │   ├── profile_binding.dart
│   │   │   ├── profile_controller.dart
│   │   │   └── profile_view.dart
│   │   ├── register
│   │   │   ├── register_binding.dart
│   │   │   ├── register_controller.dart
│   │   │   └── register_view.dart
│   │   ├── settings
│   │   │   ├── modules
│   │   │   │   ├── account
│   │   │   │   │   ├── account_binding.dart
│   │   │   │   │   ├── account_controller.dart
│   │   │   │   │   └── account_view.dart
│   │   │   │   └── theme
│   │   │   │       ├── theme_binding.dart
│   │   │   │       ├── theme_controller.dart
│   │   │   │       └── theme_view.dart
│   │   │   ├── settings_binding.dart
│   │   │   ├── settings_controller.dart
│   │   │   └── settings_view.dart
│   │   ├── tabbar
│   │   │   ├── tabbar_binding.dart
│   │   │   ├── tabbar_controller.dart
│   │   │   └── tabbar_view.dart
│   │   └── webview
│   │       ├── webview_binding.dart
│   │       ├── webview_controller.dart
│   │       └── webview_view.dart
│   ├── routes
│   │   ├── app_pages.dart
│   │   └── app_routes.dart
│   ├── ui
│   │   ├── theme.dart
│   │   └── widgets
│   │       ├── baseAppBar.dart
│   │       ├── baseWebView.dart
│   │       ├── custom_form_button.dart
│   │       ├── custom_input_field.dart
│   │       ├── menuItem.dart
│   │       └── menuItemGroup.dart
│   └── utils
│       ├── dimens.dart
│       ├── images.dart
│       ├── loading.dart
│       ├── logger.dart
│       └── showToast.dart
├── generated  // GetX cli 生成的国际化文件
│   └── locales.g.dart
└── main.dart
```

## 依赖
```
dependencies:
  permission_handler: ^11.2.0 # 用于处理权限请求和管理
  rxdart: ^0.27.7 # ReactiveX 的 Dart 实现，用于处理异步数据流
  event_bus: ^2.0.0 # 基于发布/订阅模式的事件总线
  flutter_easyrefresh: ^2.2.2 # 一个功能强大的下拉刷新和上拉加载组件
  fluttertoast: ^8.2.6 # 显示简洁的 Toast 消息
  get: ^4.6.6 # 强大的状态管理、依赖注入和路由管理库
  dio: ^5.3.3 # 强大的 Dart HTTP 请求库
  retrofit: ^4.0.3 # 用于生成 HTTP API 的客户端库，基于 Dio
  json_annotation: ^4.8.1 # 用于 JSON 序列化和反序列化的注解
  shared_preferences: ^2.2.1 # 用于持久化存储简单数据
  common_utils: ^2.1.0 # 提供一系列常用工具类
  flutter_inappwebview: 6.0.0 # 用于在 Flutter 中集成 WebView
  flutter_screenutil: ^5.9.0 # 屏幕适配工具类
  path_provider: ^2.1.2 # 提供常用路径，如临时目录和文档目录
  cupertino_icons: ^1.0.5 # iOS 风格的图标库
  logger: ^2.3.0 # 简单易用的日志工具
  appwrite: ^12.0.4 # Appwrite 的 Dart SDK，用于与 Appwrite 后端交互
  flutter_native_splash: 2.4.0 # 用于生成原生启动屏
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter # Flutter 本地化支持

```

## 使用说明
1. 克隆项目到本地：
    ```bash
    git clone <repository-url>
    ```
2. 安装依赖：
    ```bash
    flutter pub get
    ```
3. 运行项目：
    ```bash
    flutter run
    ```
4. 国际化文件：
  ```
  get generate locales assets/locales
  ```

## 目录结构说明
- `app`: 项目主目录
  - `bindings`: 依赖注入
  - `controllers`: 控制器
  - `data`: 数据管理
  - `modules`: 各个功能模块
  - `routes`: 路由管理
  - `ui`: 用户界面相关
  - `utils`: 工具类



## 贡献
欢迎提交PR或Issue。

## 许可证
MIT
```
