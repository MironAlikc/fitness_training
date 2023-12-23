import 'package:auto_route/auto_route.dart';
import 'package:fitness_training/data/models/client_model.dart';
import 'package:fitness_training/data/models/program_settings_model.dart';
import 'package:fitness_training/data/models/training_apparatus_model.dart';
import 'package:fitness_training/presentation/screens/calendar/calendar_screen.dart';
import 'package:fitness_training/presentation/screens/calendar/table_calendar_screen.dart';
import 'package:fitness_training/presentation/screens/contacts/contacts_screen.dart';
import 'package:fitness_training/presentation/screens/contacts/create_program_screen.dart';
import 'package:fitness_training/presentation/screens/contacts/program_screen.dart';
import 'package:fitness_training/presentation/screens/contacts/select_training_screens.dart';
import 'package:fitness_training/presentation/screens/contacts/settings_program/settings_program_screen.dart';
import 'package:fitness_training/presentation/screens/home_screen.dart';
import 'package:fitness_training/presentation/screens/login_screen.dart';
import 'package:fitness_training/presentation/screens/settings/change_info_screen.dart';
import 'package:fitness_training/presentation/screens/settings/settings_screen.dart';
import 'package:fitness_training/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

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
        AutoRoute(page: ProgramRoute.page, path: "/program"),
        AutoRoute(page: TableCalendarRoute.page, path: "/tableCalendar"),
        AutoRoute(page: CreateProgramRoute.page, path: "/createProgram"),
        AutoRoute(page: SelectTrainingRoute.page, path: "/selectTraining"),
        AutoRoute(page: SettingsProgramRoute.page, path: "/settingsProgram"),
        AutoRoute(page: ChangeInfoRoute.page, path: "/changeInfo"),
      ];
}
