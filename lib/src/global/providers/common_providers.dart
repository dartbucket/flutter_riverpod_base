import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/src/models/user.dart';

// TODO: prefer class over global variables.
// TODO: user functionalities are all over the places consider moving them to an authentication folder.

/// Watch the [authTokenProvider] to check if the user is logged in.
final authTokenProvider = StateProvider<String?>((ref) => null);

final currentUserProvider = StateProvider<User?>((ref) => null);
