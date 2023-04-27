import 'package:chatgpt_app/domain/entities/image_url.dart';
import 'package:chatgpt_app/infraestructure/models/image_reponse_model.dart';
import 'package:dio/dio.dart';

import '../../domain/datasources/image_datasource.dart';

class ImageDatasourceImpl implements ImageDatasource {
  @override
  Future<List<ImageUrl>> sendAndGetAnswer(String textKey) async {
    final dio = Dio();
    final response = await dio.post(
      'https://api.openai.com/v1/images/generations',
      data: {
        "prompt": textKey,
        "n": 4,
        "size": "1024x1024",
      },
      options: Options(
        headers: {"Authorization": "Bearer "},
      ),
    );

    final imageUrls =
        ImageResponseModel.fromMap(response.data).toImageUrlEntity();

    return imageUrls;
  }
}
