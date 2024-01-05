import 'package:fitness_training/core/bloc/bloc_auth/auth_bloc.dart';
import 'package:fitness_training/core/dio_settings/dio_settings.dart';
import 'package:fitness_training/core/router/router.dart';
import 'package:fitness_training/data/repositories/mindbody_repository.dart';
import 'package:fitness_training/presentation/themes/theme.dart';
import 'package:fitness_training/presentation/widgets/shared_prefs_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => MindbodyRepository(
            dio: RepositoryProvider.of<DioSettings>(context).dio,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              repo: RepositoryProvider.of<MindbodyRepository>(context),
            ),
          ),
        ],
        child: TextFieldUnfocus(
          child: SharedPrefsWidget(
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Fitness Training',
              theme: appTheme,
              routerConfig: _appRouter.config(),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldUnfocus extends StatelessWidget {
  const TextFieldUnfocus({required this.child, super.key});
  final Widget child;
  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          final FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child: child,
      );
}
