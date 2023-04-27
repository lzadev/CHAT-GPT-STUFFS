import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/message.dart';

class CustomAnimatedText extends StatelessWidget {
  const CustomAnimatedText({
    super.key,
    required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      isRepeatingAnimation: false,
      animatedTexts: [
        TyperAnimatedText(message.messageText,
            textStyle: const TextStyle(color: Colors.black))
      ],
    );
  }
}
