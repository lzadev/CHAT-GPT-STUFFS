import 'package:chatgpt_app/domain/entities/image_url.dart';
import 'package:chatgpt_app/domain/entities/message.dart';

class ImageMessageModel {
  final String? messageText;
  final Origin origin;
  final List<ImageUrl>? urls;

  ImageMessageModel({
    this.messageText,
    required this.origin,
    this.urls,
  });
}
