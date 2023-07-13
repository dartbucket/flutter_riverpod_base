import 'dart:convert';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/src/core/core.dart';
import 'package:flutter_riverpod_base/src/models/product.dart';
import 'package:flutter_riverpod_base/src/res/endpoints.dart';
import 'package:flutter_riverpod_base/src/res/strings.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';

final productRepoProvider = Provider((ref){
  final api = ref.watch(apiProvider);
  return ProductRepo(api: api);
});

class ProductRepo {
  final API _api;
  ProductRepo({required API api}) : _api = api;

  FutureEither<List<Product>> getProducts() async {
    final result = await _api.getRequest(url: Endpoints.getProducts, requireAuth: false);
    return result.fold(
      (Failure failure) {
        log(failure.message, name: LogLabel.product);
        return Left(failure);
      },
      (Response response) {
        try{
          final data = jsonDecode(response.body);
          final productJson = data['products'];
          log(productJson.toString(), name: LogLabel.product);
          final List<Product> products = [];
          for(dynamic product in productJson){
            log(product.toString(), name: LogLabel.product);
            products.add(Product.fromMap(product));
          }
          return Right(products);
        }catch (e, stktrc) {
          log(FailureMessage.jsonParsingFailed, name: LogLabel.product);
          return Left(Failure(message: FailureMessage.jsonParsingFailed, stackTrace: stktrc,));
        }
      },
    );
  }
}
