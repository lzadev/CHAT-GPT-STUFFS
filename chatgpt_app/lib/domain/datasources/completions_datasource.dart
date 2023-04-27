import 'package:chatgpt_app/domain/entities/message.dart';

abstract class CompletionsDatasource {
  Future<Message> sendAndGetAnswer(String textKey);
}
