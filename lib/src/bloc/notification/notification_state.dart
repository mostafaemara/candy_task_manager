import 'package:task_manger/src/data/model/notification.dart';

class NotificationState {
  final bool isLoading;
  final List<Notification> notifications;

  NotificationState({required this.isLoading, required this.notifications});
  const NotificationState.init()
      : isLoading = true,
        notifications = const [];

  NotificationState copyWith({
    bool? isLoading,
    List<Notification>? notifications,
  }) {
    return NotificationState(
      isLoading: isLoading ?? this.isLoading,
      notifications: notifications ?? this.notifications,
    );
  }
}
