// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'random_photo.freezed.dart';
part 'random_photo.g.dart';

@freezed
class RandomPhoto with _$RandomPhoto {
  factory RandomPhoto({
    @JsonKey(name: 'albumId') int? albumId,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'thumbnailUrl') String? thumbnailUrl,
  }) = _RandomPhoto;

  factory RandomPhoto.fromJson(Map<String, dynamic> json) =>
      _$RandomPhotoFromJson(json);
}
