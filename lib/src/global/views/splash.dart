import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/src/feature/home/view/home.dart';
import 'package:flutter_riverpod_base/src/global/controller/init_controller.dart';
import 'package:flutter_riverpod_base/src/global/providers/common_providers.dart';
import 'package:flutter_riverpod_base/src/utils/config.dart';
import 'package:go_router/go_router.dart';

// TODO: name the file splash_view.dart.
class SplashView extends ConsumerStatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  static const routePath = "/splash";

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();

    // TODO: consider to move this in a void function and call it here.
    /// check if the app is running in dev mode
    if (AppConfig.devMode) {
      /// bypass authenticaion logic.
      /// Navigate to Home

      Future.delayed(const Duration(seconds: 2)).then((value) {
        context.go(HomeView.routePath);
      });

      // TODO: consider using an early return and remove the else.
    } else {
      // TODO: Rivepord suggets to use ref.watch instead of ref.read.
      ref.read(initControllerProvider).initUserAndToken().then((value) {
        // TODO: consider combining the two lines into one ref.
        final user = ref.read(currentUserProvider);
        final token = ref.read(authTokenProvider);

        /// Check if both the [user] and [token] have value
        if (user == null || token == null) {
          // TODO: where's the authentication screen?
          // TODO: consider an early return instead of an else.
          /// Route the user to Authenticaion screen
        } else {
          /// Route the user to Home screen
          context.go(HomeView.routePath);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          "Splash",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
