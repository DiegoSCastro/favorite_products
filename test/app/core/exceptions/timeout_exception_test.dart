import 'package:flutter_test/flutter_test.dart';

class TimeoutException implements Exception {
  final String message;

  TimeoutException({required this.message});
}

void main() {
  test('TimeoutException should contain the correct message', () {
    const String errorMessage = 'Request timed out';

    final exception = TimeoutException(message: errorMessage);

    expect(exception.message, equals(errorMessage));
  });

  test('TimeoutException should be an instance of Exception', () {
    const String errorMessage = 'Request timed out';

    final exception = TimeoutException(message: errorMessage);

    expect(exception, isA<Exception>());
  });
}
