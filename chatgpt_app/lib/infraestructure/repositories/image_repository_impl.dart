import 'package:chatgpt_app/domain/datasources/image_datasource.dart';
import 'package:chatgpt_app/domain/entities/image_url.dart';

import '../../domain/repositories/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDatasource imageDatasource;

  ImageRepositoryImpl({required this.imageDatasource});

  @override
  Future<List<ImageUrl>> sendAndGetAnswer(String textKey) async {
    return await imageDatasource.sendAndGetAnswer(textKey);
  }
}
