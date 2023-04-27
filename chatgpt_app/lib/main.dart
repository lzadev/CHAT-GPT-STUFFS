import 'package:chatgpt_app/config/router/app_router.dart';
import 'package:chatgpt_app/config/theme.dart';
import 'package:chatgpt_app/infraestructure/datasources/completitions_datasource_impl.dart';
import 'package:chatgpt_app/infraestructure/repositories/completitions_repository_impl.dart';
import 'package:chatgpt_app/presentation/providers/completitions_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final completitionsRepository = CompletitionsRepositoryImpl(
        completionsDatasource: CompletitionsDatasourceImpl());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CompletitionsProvider(
            completitionsRepository,
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
