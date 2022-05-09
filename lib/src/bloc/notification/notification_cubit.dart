import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_manger/src/data/repositories/notification_repository.dart';

import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(
    this._notificationrepository,
  ) : super(const NotificationState.init());
  final Notificationrepository _notificationrepository;
  void init() async {
    final notifications = await _notificationrepository.readNotifications();
    emit(state.copyWith(isLoading: false, notifications: notifications));
  }
}
