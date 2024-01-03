// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ArchieveProgramRoute.name: (routeData) {
      final args = routeData.argsAs<ArchieveProgramRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ArchieveProgramScreen(
          key: args.key,
          apparatus: args.apparatus,
        ),
      );
    },
    CalendarRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CalendarScreen(),
      );
    },
    ChangeInfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChangeInfoScreen(),
      );
    },
    ContactsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ContactsScreen(),
      );
    },
    CreateProgramRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateProgramScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    ProgramRoute.name: (routeData) {
      final args = routeData.argsAs<ProgramRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProgramScreen(
          key: args.key,
          model: args.model,
        ),
      );
    },
    SelectTrainingRoute.name: (routeData) {
      final args = routeData.argsAs<SelectTrainingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SelectTrainingScreen(
          key: args.key,
          apparatus: args.apparatus,
        ),
      );
    },
    SettingsProgramRoute.name: (routeData) {
      final args = routeData.argsAs<SettingsProgramRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingsProgramScreen(
          key: args.key,
          programSettings: args.programSettings,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    TableCalendarRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TableCalendarScreen(),
      );
    },
  };
}

/// generated route for
/// [ArchieveProgramScreen]
class ArchieveProgramRoute extends PageRouteInfo<ArchieveProgramRouteArgs> {
  ArchieveProgramRoute({
    Key? key,
    required List<TrainingApparatusModel> apparatus,
    List<PageRouteInfo>? children,
  }) : super(
          ArchieveProgramRoute.name,
          args: ArchieveProgramRouteArgs(
            key: key,
            apparatus: apparatus,
          ),
          initialChildren: children,
        );

  static const String name = 'ArchieveProgramRoute';

  static const PageInfo<ArchieveProgramRouteArgs> page =
      PageInfo<ArchieveProgramRouteArgs>(name);
}

class ArchieveProgramRouteArgs {
  const ArchieveProgramRouteArgs({
    this.key,
    required this.apparatus,
  });

  final Key? key;

  final List<TrainingApparatusModel> apparatus;

  @override
  String toString() {
    return 'ArchieveProgramRouteArgs{key: $key, apparatus: $apparatus}';
  }
}

/// generated route for
/// [CalendarScreen]
class CalendarRoute extends PageRouteInfo<void> {
  const CalendarRoute({List<PageRouteInfo>? children})
      : super(
          CalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalendarRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChangeInfoScreen]
class ChangeInfoRoute extends PageRouteInfo<void> {
  const ChangeInfoRoute({List<PageRouteInfo>? children})
      : super(
          ChangeInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangeInfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ContactsScreen]
class ContactsRoute extends PageRouteInfo<void> {
  const ContactsRoute({List<PageRouteInfo>? children})
      : super(
          ContactsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateProgramScreen]
class CreateProgramRoute extends PageRouteInfo<void> {
  const CreateProgramRoute({List<PageRouteInfo>? children})
      : super(
          CreateProgramRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateProgramRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProgramScreen]
class ProgramRoute extends PageRouteInfo<ProgramRouteArgs> {
  ProgramRoute({
    Key? key,
    required ClientModel model,
    List<PageRouteInfo>? children,
  }) : super(
          ProgramRoute.name,
          args: ProgramRouteArgs(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'ProgramRoute';

  static const PageInfo<ProgramRouteArgs> page =
      PageInfo<ProgramRouteArgs>(name);
}

class ProgramRouteArgs {
  const ProgramRouteArgs({
    this.key,
    required this.model,
  });

  final Key? key;

  final ClientModel model;

  @override
  String toString() {
    return 'ProgramRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [SelectTrainingScreen]
class SelectTrainingRoute extends PageRouteInfo<SelectTrainingRouteArgs> {
  SelectTrainingRoute({
    Key? key,
    required List<TrainingApparatusModel> apparatus,
    List<PageRouteInfo>? children,
  }) : super(
          SelectTrainingRoute.name,
          args: SelectTrainingRouteArgs(
            key: key,
            apparatus: apparatus,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectTrainingRoute';

  static const PageInfo<SelectTrainingRouteArgs> page =
      PageInfo<SelectTrainingRouteArgs>(name);
}

class SelectTrainingRouteArgs {
  const SelectTrainingRouteArgs({
    this.key,
    required this.apparatus,
  });

  final Key? key;

  final List<TrainingApparatusModel> apparatus;

  @override
  String toString() {
    return 'SelectTrainingRouteArgs{key: $key, apparatus: $apparatus}';
  }
}

/// generated route for
/// [SettingsProgramScreen]
class SettingsProgramRoute extends PageRouteInfo<SettingsProgramRouteArgs> {
  SettingsProgramRoute({
    Key? key,
    required ProgramSettingsModel programSettings,
    List<PageRouteInfo>? children,
  }) : super(
          SettingsProgramRoute.name,
          args: SettingsProgramRouteArgs(
            key: key,
            programSettings: programSettings,
          ),
          initialChildren: children,
        );

  static const String name = 'SettingsProgramRoute';

  static const PageInfo<SettingsProgramRouteArgs> page =
      PageInfo<SettingsProgramRouteArgs>(name);
}

class SettingsProgramRouteArgs {
  const SettingsProgramRouteArgs({
    this.key,
    required this.programSettings,
  });

  final Key? key;

  final ProgramSettingsModel programSettings;

  @override
  String toString() {
    return 'SettingsProgramRouteArgs{key: $key, programSettings: $programSettings}';
  }
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TableCalendarScreen]
class TableCalendarRoute extends PageRouteInfo<void> {
  const TableCalendarRoute({List<PageRouteInfo>? children})
      : super(
          TableCalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'TableCalendarRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
