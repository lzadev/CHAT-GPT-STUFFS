import 'package:chatgpt_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/message.dart';

class MessageContainer extends StatelessWidget {
  final Message message;
  const MessageContainer({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = Theme.of(context).colorScheme;
    final backgorundColor =
        message.origin == Origin.user ? color.primary : color.secondary;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: message.origin == Origin.user
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            maxRadius: 12.0,
            backgroundColor: backgorundColor,
            child: const Icon(
              Icons.person_outlined,
              color: Colors.indigo,
            ),
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: size.width * 0.7,
            ),
            margin: const EdgeInsets.only(top: 2.0),
            padding: const EdgeInsets.all(10.0),
            // width: size.width * 0.7,
            decoration: BoxDecoration(
              color: backgorundColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: message.origin == Origin.user
                ? Text(
                    message.messageText,
                    style: const TextStyle(color: Colors.black),
                  )
                : CustomAnimatedText(
                    message: message,
                  ),
          ),
        ],
      ),
    );
  }
}
