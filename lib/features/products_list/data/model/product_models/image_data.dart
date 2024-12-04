import 'package:json_annotation/json_annotation.dart';

part 'image_data.g.dart';

@JsonSerializable()
class ImageData {
  final String? imageUrl;

  ImageData({this.imageUrl});

  factory ImageData.fromJson(Map<String, dynamic> json) =>
      _$ImageDataFromJson(json);

  Map<String, dynamic> toJson() => _$ImageDataToJson(this);
}
