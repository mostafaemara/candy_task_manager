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
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginScreen());
    },
    SignupRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SignupScreen());
    },
    NewTaskRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const NewTaskScreen());
    },
    EditeProfileRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EditeProfileScreen());
    },
    TodoRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const TodoScreen());
    },
    SchedulerRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SchedulerScreen());
    },
    NotificationsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const NotificationsScreen());
    },
    ProfileRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProfileScreen());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashRoute.name, path: '/'),
        RouteConfig(HomeRoute.name, path: '/home-screen', children: [
          RouteConfig(TodoRoute.name,
              path: 'todo-screen', parent: HomeRoute.name),
          RouteConfig(SchedulerRoute.name,
              path: 'scheduler-screen', parent: HomeRoute.name),
          RouteConfig(NotificationsRoute.name,
              path: 'notifications-screen', parent: HomeRoute.name),
          RouteConfig(ProfileRoute.name,
              path: 'profile-screen', parent: HomeRoute.name)
        ]),
        RouteConfig(LoginRoute.name, path: '/login-screen'),
        RouteConfig(SignupRoute.name, path: '/signup-screen'),
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
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-screen');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [SignupScreen]
class SignupRoute extends PageRouteInfo<void> {
  const SignupRoute() : super(SignupRoute.name, path: '/signup-screen');

  static const String name = 'SignupRoute';
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
/// [TodoScreen]
class TodoRoute extends PageRouteInfo<void> {
  const TodoRoute() : super(TodoRoute.name, path: 'todo-screen');

  static const String name = 'TodoRoute';
}

/// generated route for
/// [SchedulerScreen]
class SchedulerRoute extends PageRouteInfo<void> {
  const SchedulerRoute() : super(SchedulerRoute.name, path: 'scheduler-screen');

  static const String name = 'SchedulerRoute';
}

/// generated route for
/// [NotificationsScreen]
class NotificationsRoute extends PageRouteInfo<void> {
  const NotificationsRoute()
      : super(NotificationsRoute.name, path: 'notifications-screen');

  static const String name = 'NotificationsRoute';
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile-screen');

  static const String name = 'ProfileRoute';
}
