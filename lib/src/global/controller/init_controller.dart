import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/src/core/core.dart';
import 'package:flutter_riverpod_base/src/global/controller/shared_prefs_controller.dart';
import 'package:flutter_riverpod_base/src/global/providers/common_providers.dart';

// TODO: call the folder controllers.

// TODO: prefer class over global variables.
final initControllerProvider = Provider((ref) => InitController(ref: ref));

// TODO: this class name is not expressive. what is the purpose of this class?
class InitController {
  final Ref _ref;

  // TODO: prefer const your class. use this.ref instead.
  InitController({required Ref ref}) : _ref = ref;

  FutureVoid initUserAndToken() async {
    // TODO you are mixing then and await. use one of them.
    await _ref.read(sharedPrefsControllerPovider).getUser().then((value) {
      _ref.read(currentUserProvider.notifier).update((state) => value);
    });

    // TODO you are mixing then and await. use one of them.
    await _ref.read(sharedPrefsControllerPovider).getCookie().then((value) {
      _ref.read(authTokenProvider.notifier).update((state) => value);
    });
  }
}
