enum Flavor {
  dev,
  staging,
  prod,
}

class FlavorValues {
  FlavorValues({
    required this.baseUrl,
    required this.logNetworkInfo,
    required this.showDebugBanner,
  });
  final String baseUrl;
  final bool logNetworkInfo;
  final bool showDebugBanner;
  // 可以根据需要添加更多配置项
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final FlavorValues values;
  static FlavorConfig? _instance;

  factory FlavorConfig({
    required Flavor flavor,
    required String name,
    required FlavorValues values,
  }) {
    _instance ??= FlavorConfig._internal(flavor, name, values);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.values);

  static FlavorConfig get instance {
    return _instance!;
  }

  static bool isProduction() => _instance!.flavor == Flavor.prod;
  static bool isDevelopment() => _instance!.flavor == Flavor.dev;
  static bool isStaging() => _instance!.flavor == Flavor.staging;
}
