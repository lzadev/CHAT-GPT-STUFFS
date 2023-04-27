import 'package:chatgpt_app/domain/entities/message.dart';

class CompletitionsResponseModel {
  String id;
  String object;
  int created;
  String model;
  List<Choice> choices;
  Usage usage;

  CompletitionsResponseModel({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
  });

  factory CompletitionsResponseModel.fromJson(Map<String, dynamic> json) =>
      CompletitionsResponseModel(
        id: json["id"],
        object: json["object"],
        created: json["created"],
        model: json["model"],
        choices:
            List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
        usage: Usage.fromJson(json["usage"]),
      );

  Message toMessageEntity() {
    final messageText = choices[0].text.startsWith("\n\n")
        ? choices[0].text.replaceFirst("\n\n", '')
        : choices[0].text;
    return Message(
      messageText: messageText,
      origin: Origin.chatGpt,
    );
  }
}

class Choice {
  String text;
  int index;
  dynamic logprobs;
  String finishReason;

  Choice({
    required this.text,
    required this.index,
    this.logprobs,
    required this.finishReason,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        text: json["text"],
        index: json["index"],
        logprobs: json["logprobs"],
        finishReason: json["finish_reason"],
      );
}

class Usage {
  int promptTokens;
  int completionTokens;
  int totalTokens;

  Usage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  factory Usage.fromJson(Map<String, dynamic> json) => Usage(
        promptTokens: json["prompt_tokens"],
        completionTokens: json["completion_tokens"],
        totalTokens: json["total_tokens"],
      );
}
