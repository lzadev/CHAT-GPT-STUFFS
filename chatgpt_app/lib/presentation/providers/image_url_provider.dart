import 'package:chatgpt_app/infraestructure/repositories/image_repository_impl.dart';
import 'package:chatgpt_app/presentation/providers/shared/ui_provider.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/message.dart';
import '../../infraestructure/models/image_message.model.dart';

class ImageUrlProvider extends ChangeNotifier {
  final UiProvider uiProvider;
  final ImageRepositoryImpl imageRepository;
  List<ImageMessageModel> messages = [];
  bool isLoading = false;

  ImageUrlProvider(
    this.imageRepository,
    this.uiProvider,
  );

  Future<void> sendAndGetAnswer(String keyText) async {
    if (keyText.isEmpty) return;
    messages.add(
      ImageMessageModel(
        messageText: keyText,
        origin: Origin.user,
        urls: null,
      ),
    );
    notifyListeners();
    isLoading = true;
    notifyListeners();
    uiProvider.moveScrollToBottom();
    await Future.delayed(const Duration(seconds: 2));
    var message = await imageRepository.sendAndGetAnswer(keyText);
    messages.add(
      ImageMessageModel(
        origin: Origin.chatGpt,
        urls: message,
      ),
    );
    isLoading = false;
    notifyListeners();
    uiProvider.moveScrollToBottom();
  }
}
