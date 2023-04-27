import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class LoadingMessageContainer extends StatelessWidget {
  final String textMessage;
  const LoadingMessageContainer({super.key, required this.textMessage});

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
            constraints: BoxConstraints(maxWidth: size.width * 0.5),
            decoration: BoxDecoration(
              color: backgorundColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '$textMessage ',
                  style: const TextStyle(color: Colors.black),
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
