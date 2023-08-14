// ignore_for_file: invalid_annotation_target

import 'package:example/another_sample.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:luthor/luthor.dart';
import 'package:luthor_annotation/luthor_annotation.dart';

part 'sample.freezed.dart';

part 'sample.g.dart';

@luthor
@freezed
class Sample with _$Sample {
  const factory Sample({
    dynamic anyValue,
    required bool boolValue,
    required double doubleValue,
    required int intValue,
    required List<String> listValue,
    // The following will work with luthor_generator, but not with json_serializable
    // Null? nullValue,
    required num numValue,
    required String stringValue,
    @isEmail required String email,
    @isDateTime required String date,
    required DateTime dateTime,
    @HasLength(10) String? exactly10Characters,
    @HasMin(8) @HasMax(200) required String minAndMax,
    @IsUri(allowedSchemes: ['https']) String? httpsLink,
    @MatchRegex(r'^https:\/\/pub\.dev\/packages\/luthor')
    required String luthorPath,
    required AnotherSample anotherSample,
    @JsonKey(name: 'jsonKeyName') required String foo,
  }) = _Sample;

  static SchemaValidationResult<Sample> validate(Map<String, dynamic> json) =>
      _$SampleValidate(json);

  factory Sample.fromJson(Map<String, dynamic> json) => _$SampleFromJson(json);
}

void main() {
  final result = Sample.validate({});
  switch (result) {
    case SchemaValidationError(errors: final errors):
      print('Error: ');
      errors.forEach((key, value) {
        print('$key: $value');
      });
    case SchemaValidationSuccess(data: final data):
      print('Success: $data');
      data.validateSelf();
  }
}
