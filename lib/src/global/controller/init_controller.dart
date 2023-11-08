import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/src/core/core.dart';
import 'package:flutter_riverpod_base/src/global/controller/shared_prefs_controller.dart';
import 'package:flutter_riverpod_base/src/global/providers/common_providers.dart';

final initControllerProvider = Provider((ref) => InitController(ref: ref));

class InitController {
  final Ref _ref;

  InitController({required Ref ref}): _ref = ref;

  FutureVoid initUserAndToken() async {
    await _ref.read(sharedPrefsControllerPovider).getUser().then((value){
      _ref.read(currentUserProvider.notifier).update((state) => value);
    });

    await _ref.read(sharedPrefsControllerPovider).getCookie().then((value){
      _ref.read(authTokenProvider.notifier).update((state) => value);
    });
  }
}