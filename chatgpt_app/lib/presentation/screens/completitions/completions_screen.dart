import 'package:chatgpt_app/presentation/providers/completitions_provider.dart';
import 'package:chatgpt_app/presentation/providers/shared/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/widgets.dart';

class CompletitionsScreen extends StatelessWidget {
  static const String name = 'completitions';
  const CompletitionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Predictions',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: const _CompletionsBody(),
    );
  }
}

class _CompletionsBody extends StatelessWidget {
  const _CompletionsBody();

  @override
  Widget build(BuildContext context) {
    final completitionsProvider = context.watch<CompletitionsProvider>();
    final uiProvider = context.watch<UiProvider>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: ListView.builder(
            controller: uiProvider.completitionsScrollController,
            itemCount: completitionsProvider.messages.length,
            itemBuilder: (context, index) {
              final message = completitionsProvider.messages[index];
              return MessageContainer(
                message: message,
              );
            },
          ),
        ),
        completitionsProvider.isLoading
            ? const LoadingMessageContainer(textMessage: 'Getting the answer')
            : const SizedBox.shrink(),
        MessageInputField(
          onValueChange: completitionsProvider.sendAndGetAnswer,
          enable: completitionsProvider.isLoading,
        )
      ],
    );
  }
}
