import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/feature/home/view/home.dart';
import 'package:flutter_riverpod_base/src/global/views/splash.dart';
import 'package:go_router/go_router.dart';

// TODO: consider moving this to a router folder.
// TODO: use a class instead of a global variable.
final router = GoRouter(
  initialLocation: SplashView.routePath,
  routes: [
    GoRoute(
      path: SplashView.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashView();
      },
    ),
    GoRoute(
      path: HomeView.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
    ),
  ],
);
