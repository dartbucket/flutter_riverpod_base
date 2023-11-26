// TODO: you have a typo consider using spell checker.

/// Contains all the strings used accross the app.
/// Avoid hard coding strings.
/// All the strings must be added in this file.
/// ```dart
/// class AppStrings{
///  static const appName = "Riverpod app template";
///}
///```
// TODO: const your constructors.
// TODO: ususally it's better use i18n from the start.
class AppStrings {
  static const appName = "Riverpod app template";
}

// TODO: const your constructors.
// TODO: consider scoping this to your service/utility class.
class FailureMessage {
  static const getRequestMessage = "GET REQUEST FAILED";
  static const postRequestMessage = "POST REQUEST FAILED";
  static const putRequestMessage = "PUT REQUEST FAILED";
  static const deleteRequestMessage = "DELETE REQUEST FAILED";

  static const jsonParsingFailed = "FAILED TO PARSE JSON RESPONSE";

  static const authTokenEmpty = "AUTH TOKEN EMPTY";
}

// TODO: consider scoping this to your service/utility class.
class LogLabel {
  static const product = "PRODUCT";
  static const auth = "AUTH";
  static const httpGet = "HTTP/GET";
  static const httpPost = "HTTP/POST";
  static const httpPut = "HTTP/PUT";
  static const httpDelete = "HTTP/DELETE";
  // TODO: don't shorten your variable names, write sharedPreference instead.
  static const sharedPrefs = "SHARED_PREFERENCES";
}
