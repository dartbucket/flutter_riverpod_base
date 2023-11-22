import 'package:flutter_riverpod_base/src/utils/config.dart';

class BasePaths{

  const BasePaths._();

  static const baseImagePath = "assets/images";
  static const baseAnimationPath = "assets/animations";
  static const baseIconPath = "assets/icons";
  static const basePlaceholderPath = "assets/placeholders";
  static const baseProdUrl = "http://productionURL.com";
  static const baseTestUrl = "https://dummyjson.com";
  static const baseUrl = AppConfig.devMode ? baseTestUrl : baseProdUrl;
}