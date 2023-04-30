import 'package:luthor/src/validation.dart';

class DoubleValidation extends Validation {
  String? customMessage;

  DoubleValidation({
    String? message,
  }) : customMessage = message;

  @override
  bool call(String? fieldName, dynamic value) {
    this.fieldName = fieldName;
    return value is double?;
  }

  @override
  String get message =>
      customMessage ?? '${fieldName ?? 'value'} must be a double';

  @override
  Map<String, List<String>>? get errors => null;
}
