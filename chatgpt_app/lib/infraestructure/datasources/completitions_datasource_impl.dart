import 'package:chatgpt_app/domain/datasources/completions_datasource.dart';
import 'package:chatgpt_app/domain/entities/message.dart';
import 'package:chatgpt_app/infraestructure/models/completitions_response_model.dart';
import 'package:dio/dio.dart';

class CompletitionsDatasourceImpl implements CompletionsDatasource {
  @override
  Future<Message> sendAndGetAnswer(String textKey) async {
    final dio = Dio();
    final response = await dio.post(
      'https://api.openai.com/v1/completions',
      data: {
        "model": "text-davinci-003",
        "prompt": textKey,
        "max_tokens": 1000,
        "temperature": 1
      },
      options: Options(
        headers: {"Authorization": "Bearer "},
      ),
    );

    final message =
        CompletitionsResponseModel.fromJson(response.data).toMessageEntity();

    return message;
  }
}
