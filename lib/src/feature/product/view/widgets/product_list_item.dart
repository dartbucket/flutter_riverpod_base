import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/models/product.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    // TODO: why use a ListTile if you're only using two of its properties?
    // TODO: create your own widget instead. you can use SizedBox, DecoratedBox, etc.
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(product.description),
        ],
      ),
    );
  }
}
