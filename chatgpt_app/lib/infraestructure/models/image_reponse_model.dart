import 'dart:convert';

import '../../domain/entities/image_url.dart';

class ImageResponseModel {
  int created;
  List<ImageUrlData> data;

  ImageResponseModel({
    required this.created,
    required this.data,
  });

  factory ImageResponseModel.fromJson(String str) =>
      ImageResponseModel.fromMap(json.decode(str));

  factory ImageResponseModel.fromMap(Map<String, dynamic> json) =>
      ImageResponseModel(
        created: json["created"],
        data: List<ImageUrlData>.from(
            json["data"].map((x) => ImageUrlData.fromMap(x))),
      );

  List<ImageUrl> toImageUrlEntity() {
    return data.map((e) => ImageUrl(url: e.url)).toList();
  }
}

class ImageUrlData {
  String url;

  ImageUrlData({
    required this.url,
  });

  factory ImageUrlData.fromJson(String str) =>
      ImageUrlData.fromMap(json.decode(str));

  factory ImageUrlData.fromMap(Map<String, dynamic> json) => ImageUrlData(
        url: json["url"],
      );
}
