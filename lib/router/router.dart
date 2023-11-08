import 'package:auto_route/auto_route.dart';
import 'package:fitness_training/presentation/screens/calendar/calendar_screen.dart';
import 'package:fitness_training/presentation/screens/contacts/contacts_screen.dart';
import 'package:fitness_training/presentation/screens/home_screen.dart';
import 'package:fitness_training/presentation/screens/login_screen.dart';
import 'package:fitness_training/presentation/screens/settings/settings_screen.dart';
import 'package:fitness_training/presentation/screens/splash_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: "/"),
        AutoRoute(page: LoginRoute.page, path: "/login"),
        AutoRoute(
          page: HomeRoute.page,
          path: "/home",
          children: [
            AutoRoute(
              page: CalendarRoute.page,
              path: "calendar",
            ),
            AutoRoute(
              page: ContactsRoute.page,
              path: "contacts",
            ),
            AutoRoute(
              page: SettingsRoute.page,
              path: "settings",
            ),
          ],
        ),
      ];
}
