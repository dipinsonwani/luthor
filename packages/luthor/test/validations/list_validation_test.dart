import 'package:luthor/luthor.dart';
import 'package:test/test.dart';

void main() {
  test('should return true for an empty list', () {
    final result = l.list().validateValue([]);
    expect(result.isValid, true);

    result.whenOrNull(
      error: (_) => fail('should not be error'),
    );
  });

  test('should return true for a list of any items', () {
    final result = l.list().validateValue(['a', 1.1, 1]);
    expect(result.isValid, true);

    result.whenOrNull(
      error: (_) => fail('should not be error'),
    );
  });

  test('should return true if the list contains only specified types', () {
    final result =
        l.list(validators: [l.string(), l.int()]).validateValue(['a', 1]);
    expect(result.isValid, true);

    result.whenOrNull(
      error: (_) => fail('should not be error'),
    );
  });

  test(
      'should return false if the list contains an item that does not match the specified type',
      () {
    final result =
        l.list(validators: [l.string(), l.int()]).validateValue(['a', 1.1]);

    result.when(
      error: (errors) {
        expect(
          errors,
          ['value must be a list or does not match the validations'],
        );
      },
      success: (_) => fail('should not be success'),
    );
  });

  test(
      'should return false if the list contains an item that is null and all types are required',
      () {
    final result = l.list(
      validators: [
        l.string().required(),
        l.int().required(),
      ],
    ).validateValue(['a', null]);

    result.when(
      error: (errors) {
        expect(
          errors,
          ['value must be a list or does not match the validations'],
        );
      },
      success: (_) => fail('should not be success'),
    );
  });
}
