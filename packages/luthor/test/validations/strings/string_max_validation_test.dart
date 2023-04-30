import 'package:luthor/luthor.dart';
import 'package:test/test.dart';

void main() {
  test(
    'should return true if the string length is less than or equal to maxLength',
    () {
      final result = l.string().max(3).validateValue('abc');
      expect(result.isValid, isTrue);

      result.whenOrNull(
        error: (_) => fail('should not be error'),
      );
    },
  );

  test(
    'should return false if the string length is less than minLength',
    () {
      final result = l.string().max(3).validateValue('abcd');

      result.when(
        error: (errors) {
          expect(errors, ['value must not be more than 3 characters long']);
        },
        success: (_) => fail('should not be success'),
      );
    },
  );

  test(
    'should return true when the value is null',
    () {
      final result = l.string().max(3).validateValue(null);
      expect(result.isValid, isTrue);

      result.whenOrNull(
        error: (_) => fail('should not be error'),
      );
    },
  );

  test(
    'should return false if the value is null with required()',
    () {
      final result = l.string().max(3).required().validateValue(null);

      result.when(
        error: (errors) {
          expect(errors, ['value is required']);
        },
        success: (_) => fail('should not be success'),
      );
    },
  );
}
