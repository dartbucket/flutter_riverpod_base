import 'package:flutter_riverpod_base/src/res/base.dart';

// TODO: const your class with a private constructor to prevent instantiation.
// ! Example: const EndPoints._();

// TODO: Research OOP best practices. (Abstract class, inheritance, etc.)
// ! you should not have class duplicates class and file names.

class EndPoints {
  static const _base = BasePaths.baseUrl;
  static const getProducts = "$_base/products";
}

class FailureMessage {
  static const jsonParse = "JSON parsing failed";
  // TODO: you have typo consider using SpellChecker extension.
  static const productsFetched = "Fialed to fetch products";
}

class SuccessMessage {
  static const productsFetched = "Products fetched successfully";
}
