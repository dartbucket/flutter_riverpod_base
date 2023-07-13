# flutter_riverpod_base

A Starter project for flutter with riverpod and http preconfigured in architecture.

# Project Structure

```bash
.
├── main.dart
└── src
    ├── app.dart
    ├── commons
    │   ├── controller
    │   ├── providers
    │   │   └── common_providers.dart
    │   ├── repository
    │   └── views
    │       └── splash.dart
    ├── core
    │   ├── api.dart
    │   ├── core.dart
    │   ├── failure.dart
    │   └── type_def.dart
    ├── feature
    │   ├── home
    │   │   ├── controller
    │   │   ├── repository
    │   │   └── view
    │   │       └── home.dart
    │   └── product
    │       ├── controller
    │       │   └── product.dart
    │       ├── repository
    │       │   └── product.dart
    │       └── view
    │           ├── products.dart
    │           └── widgets
    │               └── product_list_item.dart
    ├── models
    │   └── product.dart
    ├── res
    │   ├── assets.dart
    │   ├── base.dart
    │   ├── endpoints.dart
    │   └── strings.dart
    └── utils
        ├── alert.dart
        ├── config.dart
        ├── router.dart
        └── snackbar_service.dart
```
