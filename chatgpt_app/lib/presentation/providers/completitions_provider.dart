import 'package:chatgpt_app/domain/entities/message.dart';
import 'package:chatgpt_app/domain/repositories/completitions_repository.dart';
import 'package:flutter/material.dart';

class CompletitionsProvider extends ChangeNotifier {
  final CompletitionsRepository completitionsRepository;
  final ScrollController completitionsScrollController = ScrollController();
  List<Message> messages = [];
  bool isLoading = false;

  CompletitionsProvider(this.completitionsRepository);

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
    moveScrollToBottom();
    await Future.delayed(const Duration(seconds: 2));
    var message = await completitionsRepository.sendAndGetAnswer(keyText);
    messages.add(message);
    isLoading = false;
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 700));
    completitionsScrollController.animateTo(
      completitionsScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }
}
