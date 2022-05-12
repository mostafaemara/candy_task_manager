// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SplashScreen());
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomeScreen());
    },
    OnboardingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const OnboardingScreen());
    },
    NewTaskRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const NewTaskScreen());
    },
    EditeProfileRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EditeProfileScreen());
    },
    TodayTasksRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const TodayTasksScreen());
    },
    UpcomingTasksRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const UpcomingTasksScreen());
    },
    NotificationsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const NotificationsScreen());
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SettingsScreen());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashRoute.name, path: '/'),
        RouteConfig(HomeRoute.name, path: '/home-screen', children: [
          RouteConfig(TodayTasksRoute.name,
              path: 'today-tasks-screen', parent: HomeRoute.name),
          RouteConfig(UpcomingTasksRoute.name,
              path: 'upcoming-tasks-screen', parent: HomeRoute.name),
          RouteConfig(NotificationsRoute.name,
              path: 'notifications-screen', parent: HomeRoute.name),
          RouteConfig(SettingsRoute.name,
              path: 'settings-screen', parent: HomeRoute.name)
        ]),
        RouteConfig(OnboardingRoute.name, path: '/onboarding-screen'),
        RouteConfig(NewTaskRoute.name, path: '/new-task-screen'),
        RouteConfig(EditeProfileRoute.name, path: '/edite-profile-screen')
      ];
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home-screen', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute()
      : super(OnboardingRoute.name, path: '/onboarding-screen');

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [NewTaskScreen]
class NewTaskRoute extends PageRouteInfo<void> {
  const NewTaskRoute() : super(NewTaskRoute.name, path: '/new-task-screen');

  static const String name = 'NewTaskRoute';
}

/// generated route for
/// [EditeProfileScreen]
class EditeProfileRoute extends PageRouteInfo<void> {
  const EditeProfileRoute()
      : super(EditeProfileRoute.name, path: '/edite-profile-screen');

  static const String name = 'EditeProfileRoute';
}

/// generated route for
/// [TodayTasksScreen]
class TodayTasksRoute extends PageRouteInfo<void> {
  const TodayTasksRoute()
      : super(TodayTasksRoute.name, path: 'today-tasks-screen');

  static const String name = 'TodayTasksRoute';
}

/// generated route for
/// [UpcomingTasksScreen]
class UpcomingTasksRoute extends PageRouteInfo<void> {
  const UpcomingTasksRoute()
      : super(UpcomingTasksRoute.name, path: 'upcoming-tasks-screen');

  static const String name = 'UpcomingTasksRoute';
}

/// generated route for
/// [NotificationsScreen]
class NotificationsRoute extends PageRouteInfo<void> {
  const NotificationsRoute()
      : super(NotificationsRoute.name, path: 'notifications-screen');

  static const String name = 'NotificationsRoute';
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings-screen');

  static const String name = 'SettingsRoute';
}
