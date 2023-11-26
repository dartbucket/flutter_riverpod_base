import 'package:flutter_riverpod_base/src/res/base.dart';

// TODO: const your class with a private constructor to prevent instantiation.
// ! Example: const EndPoints._();
class EndPoints {
  static const _base = BasePaths.baseUrl;
  static const upload = "$_base/storage/upload";
}
