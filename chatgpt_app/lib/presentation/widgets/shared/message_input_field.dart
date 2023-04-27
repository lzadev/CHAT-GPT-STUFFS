import 'package:chatgpt_app/presentation/providers/completitions_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageInputField extends StatelessWidget {
  final ValueChanged<String> onValueChange;
  const MessageInputField({
    super.key,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    final completitionsProvider = context.read<CompletitionsProvider>();
    final textController = TextEditingController();
    final focusNode = FocusNode();

    const outlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );

    final inputDecoration = InputDecoration(
      hintText: 'Send a message',
      filled: true,
      suffixIcon: IconButton(
        onPressed: () {
          final textValue = textController.value.text;
          textController.clear();
          onValueChange(textValue);
        },
        icon: const Icon(
          Icons.send_outlined,
        ),
      ),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      disabledBorder: outlineInputBorder,
    );

    return TextFormField(
      enabled: !completitionsProvider.isLoading,
      controller: textController,
      focusNode: focusNode,
      decoration: inputDecoration,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      onFieldSubmitted: (value) {
        onValueChange(value);
        textController.clear();
        focusNode.requestFocus();
      },
      onTap: () => completitionsProvider.moveScrollToBottom(),
    );
  }
}
