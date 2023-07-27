import 'package:flutter_test/flutter_test.dart';

class RepositoryException implements Exception {
  final String message;

  RepositoryException({required this.message});
}

void main() {
  test('RepositoryException should contain the correct message', () {
    const String errorMessage = 'Repository error occurred';

    final exception = RepositoryException(message: errorMessage);

    expect(exception.message, equals(errorMessage));
  });

  test('RepositoryException should be an instance of Exception', () {
    const String errorMessage = 'Repository error occurred';

    final exception = RepositoryException(message: errorMessage);

    expect(exception, isA<Exception>());
  });
}
