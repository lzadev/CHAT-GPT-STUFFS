import '../entities/message.dart';

abstract class CompletitionsRepository {
  Future<Message> sendAndGetAnswer(String textKey);
}
