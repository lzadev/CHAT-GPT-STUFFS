import 'package:chatgpt_app/presentation/providers/shared/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageInputField extends StatelessWidget {
  final ValueChanged<String> onValueChange;
  final bool enable;

  const MessageInputField({
    super.key,
    required this.onValueChange,
    required this.enable,
  });

  @override
  Widget build(BuildContext context) {
    final uiProvider = context.read<UiProvider>();
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
      enabled: !enable,
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
      onTap: () => uiProvider.moveScrollToBottom(),
    );
  }
}
