import 'package:freezed_annotation/freezed_annotation.dart';

part 'electronic.freezed.dart';

@freezed
class Electronic with _$Electronic {
  factory Electronic({
    String? id,
    String? name,
    String? englishName,
    String? description,
    String? image,
    List<String>? gripe,
  }) = _Electronic;
}
