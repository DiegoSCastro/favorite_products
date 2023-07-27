import 'package:flutter_test/flutter_test.dart';

class DioException implements Exception {
  final String message;

  DioException({required this.message});
}

void main() {
  test('DioException should contain the correct message', () {
    const String errorMessage = 'Dio error occurred';

    final exception = DioException(message: errorMessage);

    expect(exception.message, equals(errorMessage));
  });

  test('DioException should be an instance of Exception', () {
    const String errorMessage = 'Dio error occurred';
    final exception = DioException(message: errorMessage);

    expect(exception, isA<Exception>());
  });
}
