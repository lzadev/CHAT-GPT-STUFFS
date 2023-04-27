import 'package:chatgpt_app/config/router/app_router.dart';
import 'package:chatgpt_app/config/theme.dart';
import 'package:chatgpt_app/infraestructure/datasources/completitions_datasource_impl.dart';
import 'package:chatgpt_app/infraestructure/datasources/image_datasource_impl.dart';
import 'package:chatgpt_app/infraestructure/repositories/completitions_repository_impl.dart';
import 'package:chatgpt_app/presentation/providers/completitions_provider.dart';
import 'package:chatgpt_app/presentation/providers/shared/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'infraestructure/repositories/image_repository_impl.dart';
import 'presentation/providers/image_url_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final completitionsRepository = CompletitionsRepositoryImpl(
        completionsDatasource: CompletitionsDatasourceImpl());
    final imageRepository = ImageRepositoryImpl(
      imageDatasource: ImageDatasourceImpl(),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UiProvider(),
        ),
        ChangeNotifierProxyProvider<UiProvider, CompletitionsProvider>(
          create: (context) => CompletitionsProvider(
            completitionsRepository,
            Provider.of<UiProvider>(context, listen: false),
          ),
          update: (context, value, previous) => CompletitionsProvider(
            completitionsRepository,
            value,
          ),
        ),
        ChangeNotifierProxyProvider<UiProvider, ImageUrlProvider>(
          create: (context) => ImageUrlProvider(
            imageRepository,
            Provider.of<UiProvider>(context, listen: false),
          ),
          update: (context, value, previous) => ImageUrlProvider(
            imageRepository,
            value,
          ),
        )
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
      ),
    );
  }
}
