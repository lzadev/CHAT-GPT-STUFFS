import 'package:chatgpt_app/domain/entities/image_url.dart';
import 'package:chatgpt_app/domain/entities/message.dart';
import 'package:chatgpt_app/presentation/providers/image_url_provider.dart';
import 'package:chatgpt_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/shared/ui_provider.dart';

class ImagesScreen extends StatelessWidget {
  static const String name = 'images';
  const ImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Images Generator',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: const _ImagesView(),
    );
  }
}

class _ImagesView extends StatelessWidget {
  const _ImagesView();

  @override
  Widget build(BuildContext context) {
    final uiProvider = context.watch<UiProvider>();
    final imageUrlProvider = context.watch<ImageUrlProvider>();
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: uiProvider.completitionsScrollController,
            itemCount: imageUrlProvider.messages.length,
            itemBuilder: (context, index) {
              final message = imageUrlProvider.messages[index];
              return message.origin == Origin.user
                  ? MessageContainer(
                      message: Message(
                        messageText: message.messageText!,
                        origin: message.origin,
                      ),
                    )
                  : _ImageMessageContainer(
                      urls: message.urls!,
                    );
            },
          ),
        ),
        imageUrlProvider.isLoading
            ? const LoadingMessageContainer(textMessage: 'Getting the images')
            : const SizedBox.shrink(),
        MessageInputField(
          onValueChange: imageUrlProvider.sendAndGetAnswer,
          enable: false,
        )
      ],
    );
  }
}

class _ImageMessageContainer extends StatelessWidget {
  final List<ImageUrl> urls;
  const _ImageMessageContainer({required this.urls});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = Theme.of(context).colorScheme;
    final background = color.secondary;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            maxRadius: 12.0,
            backgroundColor: background,
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
            // padding: const EdgeInsets.all(10.0),
            // width: size.width * 0.7,
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: urls.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                final imageUrl = urls[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50.0,
                    width: size.width * 0.5,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/loading_icon.gif',
                      image: imageUrl.url,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
