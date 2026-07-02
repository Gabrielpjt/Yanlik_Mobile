class AppConfig {
  // Singleton pattern
  static final AppConfig _instance = AppConfig._internal();
  factory AppConfig() => _instance;
  AppConfig._internal();

  // Environment
  String get environment => const String.fromEnvironment(
        'ENV',
        defaultValue: 'development',
      );

  bool get isDevelopment => environment == 'development';
  bool get isProduction => environment == 'production';
  bool get isStaging => environment == 'staging';

  // API Configuration
  String get baseUrl {
    switch (environment) {
      case 'production':
        return 'https://api.production.com';
      case 'staging':
        return 'https://api.staging.com';
      default:
        return 'https://api.dev.com';
    }
  }

  int get apiTimeout => 30000; // 30 seconds

  // App Information
  String get appName => 'Portal Layanan Publik';
  String get appVersion => '1.0.0';
}
