import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/src/core/core.dart';
import 'package:flutter_riverpod_base/src/feature/product/res/endpoints.dart';
import 'package:flutter_riverpod_base/src/models/product.dart';
import 'package:flutter_riverpod_base/src/res/strings.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';

final productRepoProvider = Provider((ref) {
  final api = ref.watch(networkRepoProvider);

  return ProductRepo(api: api);
});

// TODO: don't abbreviate, use ProductRepository instead.
class ProductRepo {
  final NetworkRepo _api;

  // TODO: this ain't ProductController, what does name mean?
  final _name = "PRODUCT_CONTROLLER";

  // TODO: you do not need to pass the api to the constructor.
  // ! It prevents you to make it a constant, use this.api instead.
  ProductRepo({required NetworkRepo api}) : _api = api;

  // TODO: Consider a service layer.
  // TODO: You should probably write a wrapper for this and delegate success, error, loading to the service layer. then you can resolve the result here.
  FutureEither<List<Product>> getProducts() async {
    final result =
        await _api.getRequest(url: EndPoints.getProducts, requireAuth: false);

    return result.fold(
      (Failure failure) {
        log(failure.message, name: _name);

        return Left(failure);
      },
      (Response response) {
        try {
          final data = jsonDecode(response.body);
          final productJson = data['products'];
          log(productJson.toString(), name: _name);
          final products = <Product>[];
          // TODO: don't use dynamic.
          for (dynamic product in productJson) {
            log(product.toString(), name: _name);
            // TODO: prefer fromJson from json_serializable package.
            products.add(Product.fromMap(product));
          }

          return Right(products);
        } catch (e, stktrc) {
          log(FailureMessage.jsonParsingFailed, name: _name);

          return Left(Failure(
            message: FailureMessage.jsonParsingFailed,
            stackTrace: stktrc,
          ));
        }
      },
    );
  }
}
