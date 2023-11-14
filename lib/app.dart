import 'package:fitness_training/presentation/themes/theme.dart';
import 'package:fitness_training/router/router.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fitness Training',
      theme: appTheme,
      routerConfig: _appRouter.config(),
    );
  }
}
