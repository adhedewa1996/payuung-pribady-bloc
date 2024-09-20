// ALIAS FOR CLEAR CODE WHEN CALLING RESULT CLASS
typedef ResultApi<T> = Result;
typedef MapData = Map<String, dynamic>;

// SEALED CLASS RESULT
sealed class Result<S, E extends Exception> {
  const Result();
}

final class Success<S, E extends Exception> extends Result<S, E> {
  const Success(
    this.value,
  );
  final S value;
}

final class Failure<S, E extends Exception> extends Result<S, E> {
  const Failure({
    required this.exception,
    required this.statusCode,
  });
  final E exception;
  final int statusCode;
}
