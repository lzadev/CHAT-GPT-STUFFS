import 'package:chatgpt_app/domain/entities/message.dart';
import 'package:chatgpt_app/domain/repositories/completitions_repository.dart';
import 'package:chatgpt_app/presentation/providers/shared/ui_provider.dart';
import 'package:flutter/material.dart';

class CompletitionsProvider extends ChangeNotifier {
  final CompletitionsRepository completitionsRepository;
  final UiProvider uiProvider;

  List<Message> messages = [];
  bool isLoading = false;

  CompletitionsProvider(this.completitionsRepository, this.uiProvider);

  Future<void> sendAndGetAnswer(String keyText) async {
    if (keyText.isEmpty) return;
    messages.add(
      Message(
        messageText: keyText,
        origin: Origin.user,
      ),
    );
    notifyListeners();
    isLoading = true;
    notifyListeners();
    uiProvider.moveScrollToBottom();
    await Future.delayed(const Duration(seconds: 2));
    var message = await completitionsRepository.sendAndGetAnswer(keyText);
    messages.add(message);
    isLoading = false;
    notifyListeners();
    uiProvider.moveScrollToBottom();
  }
}
