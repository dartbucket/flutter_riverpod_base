import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/src/feature/product/repository/product.dart';
import 'package:flutter_riverpod_base/src/feature/product/res/messages.dart';
import 'package:flutter_riverpod_base/src/models/product.dart';
import 'package:flutter_riverpod_base/src/utils/config.dart';
import 'package:flutter_riverpod_base/src/utils/snackbar_service.dart';

final productControllerProvider = Provider((ref) {
  final repo = ref.watch(productRepoProvider);
  return ProductController(repo: repo);
});

class ProductController {
  final ProductRepo _repo;
  ProductController({required ProductRepo repo}) : _repo = repo;

  Future<List<Product>?> getProducts({ BuildContext? context }) async {
    final result = await _repo.getProducts();
    return result.fold(
      (failure){
        if(AppConfig.devMode && context!=null){
          SnackBarService.showSnackBar(context: context, message: SuccessMessage.productsFetched);
        }
        return null;
      },
      (products){
        if(AppConfig.devMode && context!=null){
          SnackBarService.showSnackBar(context: context, message: FailureMessage.productsFetched);
        }
        return products;
      },
    );
  }
}
