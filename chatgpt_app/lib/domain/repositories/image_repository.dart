import 'package:chatgpt_app/domain/entities/image_url.dart';

abstract class ImageRepository {
  Future<List<ImageUrl>> sendAndGetAnswer(String textKey);
}
