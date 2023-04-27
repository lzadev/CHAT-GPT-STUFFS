import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.link,
    required this.subTitle,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Completitions',
    subTitle:
        'Given a prompt, the model will return one or more predicted completions.',
    link: '/completitions',
    icon: Icons.online_prediction_outlined,
  ),
  MenuItem(
    title: 'Images',
    subTitle:
        'Given a prompt and/or an input image, the model will generate a new image.',
    link: '/images',
    icon: Icons.camera_alt_outlined,
  ),
];
