import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/src/feature/product/controller/product.dart';
import 'package:flutter_riverpod_base/src/feature/product/view/widgets/product_list_item.dart';

// TODO: you don't need plural here. you can name it ProductList.
class ProductsList extends ConsumerWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productController = ref.watch(productControllerProvider);

    return FutureBuilder(
      future: productController.getProducts(context: context),
      // TODO: use a switch case over elseif.
      // TODO: context isn't used replace it by a _.
      builder: (context, snapshot) {
        // TODO: move this down only when you need it.
        final data = snapshot.data;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          // TODO: you're using Center(Text..) alot, perhaps you can create an AppError widget.
          return const Center(
            child: Text("Error Loading Data"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          // TODO: it's pernal choice, but I prefer to use an early return instead of a ternary.
          return data != null
              ? ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ProductListItem(product: data[index]);
                  },
                )
              : const Center(
                  child: Text("Error Loading Data"),
                );

          // TODO: this is dead code.
          return const Center(
            child: Text("Error Loading Data"),
          );
        }

        // TODO: could be an AppLoader widget.
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
