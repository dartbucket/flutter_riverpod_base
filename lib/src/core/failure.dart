// TODO: consider scoping this to your service, network or log class.
class Failure {
  final String message;
  final StackTrace stackTrace;

// TODO: const your classes.
  // ignore: prefer-declaring-const-constructor
  Failure({
    required this.message,
    this.stackTrace = StackTrace.empty,
  });
}
