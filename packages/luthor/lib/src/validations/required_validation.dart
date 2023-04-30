import 'package:luthor/src/validation.dart';

class RequiredValidation extends Validation {
  String? customMessage;

  RequiredValidation({
    String? message,
  }) : customMessage = message;

  @override
  bool call(String? fieldName, dynamic value) {
    this.fieldName = fieldName;
    return value != null;
  }

  @override
  String get message => customMessage ?? '${fieldName ?? 'value'} is required';

  @override
  Map<String, List<String>>? get errors => null;
}
