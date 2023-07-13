import 'package:flutter_riverpod_base/src/res/base.dart';


/// Contains all the API endpoints used in the application.
/// Example :
/// 
/// An endpoint can be used the following way
/// ```dart
/// final response = await http.get(Endpoints.getUser)
/// ```

class Endpoints{
  static const _base = BasePaths.baseUrl;

  static const getUser = "$_base/user";

  static const getProducts = "$_base/products";
}