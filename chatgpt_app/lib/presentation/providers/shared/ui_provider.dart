import 'package:flutter/widgets.dart';

class UiProvider extends ChangeNotifier {
  final ScrollController completitionsScrollController = ScrollController();

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 700));
    completitionsScrollController.animateTo(
      completitionsScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }
}
