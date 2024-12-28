// ignore_for_file: constant_identifier_names

/// Environment variables and shared app constants.
abstract class AppConfig {
  // Examples:
  // static const DEBUG = bool.fromEnvironment('DEBUG', defaultValue: false);
  // static const TEST = String.fromEnvironment('TEST', defaultValue: '');

  static const LOCAL = bool.fromEnvironment('LOCAL', defaultValue: false);

  static const String GOOGLE_API_KEY =
      String.fromEnvironment('GOOGLE_API_KEY', defaultValue: '');
  static const String GOOGLE_CSE_ID =
      String.fromEnvironment('GOOGLE_CSE_ID', defaultValue: '');
}
