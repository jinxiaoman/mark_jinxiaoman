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
│   │   ├── appwrite_service.dart
│   │   └── global_state.dart
│   ├── modules
│   │   ├── about
│   │   │   ├── bindings
│   │   │   │   └── about_binding.dart
│   │   │   ├── controllers
│   │   │   │   └── about_controller.dart
│   │   │   └── views
│   │   │       └── about_view.dart
│   │   ├── home
│   │   │   ├── bindings
│   │   │   │   └── home_binding.dart
│   │   │   ├── controllers
│   │   │   │   └── home_controller.dart
│   │   │   └── views
│   │   │       └── home_view.dart
│   │   ├── login
│   │   │   ├── bindings
│   │   │   │   └── login_binding.dart
│   │   │   ├── controllers
│   │   │   │   └── login_controller.dart
│   │   │   └── views
│   │   │       └── login_view.dart
│   ├── routes
│   │   ├── app_pages.dart
│   │   └── app_routes.dart
│   ├── ui
│   │   ├── theme.dart
│   │   └── widgets
│   │       ├── menuItem.dart
│   │       └── menuItemGroup.dart
│   └── utils
│       ├── dimens.dart
│       ├── images.dart
│       ├── intl.dart
│       └── logger.dart
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

## 常见问题
- 如何添加新模块？
  - 在`modules`目录下创建新文件夹，并按照现有模块的结构添加`bindings`、`controllers`和`views`。
- 三级模块
```

lib/
├── modules/
│   ├── profile/
│   │   ├── bindings/
│   │   │   └── profile_binding.dart
│   │   ├── controllers/
│   │   │   └── profile_controller.dart
│   │   ├── views/
│   │   │   └── profile_view.dart
│   │   ├── modules/
│   │   │   ├── profile_xxx/
│   │   │   │   ├── bindings/
│   │   │   │   │   └── profile_xxx_binding.dart
│   │   │   │   ├── controllers/
│   │   │   │   │   └── profile_xxx_controller.dart
│   │   │   │   ├── views/
│   │   │   │   │   └── profile_xxx_view.dart
│   │   │   ├── profile_yyy/
│   │   │   │   ├── bindings/
│   │   │   │   │   └── profile_yyy_binding.dart
│   │   │   │   ├── controllers/
│   │   │   │   │   └── profile_yyy_controller.dart
│   │   │   │   ├── views/
│   │   │   │   │   └── profile_yyy_view.dart
这种结构的优点是：

模块化清晰：每个模块都有自己的绑定、控制器和视图，便于维护和扩展。
层次分明：子模块可以进一步细分，适用于复杂的业务逻辑。
易于导航：通过目录结构，开发者可以快速找到相关文件。
```

## 贡献
欢迎提交PR或Issue。

## 许可证
MIT
```
