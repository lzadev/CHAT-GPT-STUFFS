import 'package:chatgpt_app/domain/datasources/completions_datasource.dart';
import 'package:chatgpt_app/domain/entities/message.dart';
import 'package:chatgpt_app/domain/repositories/completitions_repository.dart';

class CompletitionsRepositoryImpl implements CompletitionsRepository {
  final CompletionsDatasource completionsDatasource;

  CompletitionsRepositoryImpl({required this.completionsDatasource});
  @override
  Future<Message> sendAndGetAnswer(String textKey) {
    return completionsDatasource.sendAndGetAnswer(textKey);
  }
}
