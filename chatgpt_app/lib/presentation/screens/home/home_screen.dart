import 'package:chatgpt_app/config/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatGPT-APP'),
      ),
      body: const _HomeBody(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _MenuItem(
          menuItem: menuItem,
        );
      },
    );
  }
}

class _MenuItem extends StatelessWidget {
  final MenuItem menuItem;
  const _MenuItem({
    required this.menuItem,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        menuItem.title,
      ),
      subtitle: Text(
        menuItem.subTitle,
      ),
      leading: Icon(
        menuItem.icon,
      ),
      trailing: const Icon(
        Icons.arrow_forward_outlined,
      ),
      onTap: () {
        context.push(menuItem.link);
      },
    );
  }
}
