import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatgpt_app/presentation/providers/completitions_provider.dart';
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: ListView.builder(
            controller: completitionsProvider.completitionsScrollController,
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
            ? _LoadingMessageContainer()
            : const SizedBox.shrink(),
        MessageInputField(
          onValueChange: completitionsProvider.sendAndGetAnswer,
        )
      ],
    );
  }
}

class _LoadingMessageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = Theme.of(context).colorScheme;
    final backgorundColor = color.secondary;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 2.0),
            padding: const EdgeInsets.all(10.0),
            width: size.width * 0.4,
            decoration: BoxDecoration(
              color: backgorundColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'getting the answer ',
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TyperAnimatedText(
                      '...',
                      textStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
