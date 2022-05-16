import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:task_manger/src/data/model/notification.dart" as not;
import 'package:task_manger/src/bloc/notification/notification_cubit.dart';
import 'package:task_manger/src/bloc/notification/notification_state.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:task_manger/src/styles/colors.dart';
import 'package:task_manger/src/ui/common/custom_app_bar.dart';
import 'package:task_manger/src/ui/common/header.dart';
import 'package:task_manger/src/utils/images.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) => SizedBox(
                child: Column(
              children: [
                CustomAppBar(
                  title:
                      AppLocalizations.of(context)!.notifications.toUpperCase(),
                ),
                Header(title: AppLocalizations.of(context)!.alerts),
                Expanded(
                    child: state.isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          )
                        : state.notifications.isEmpty
                            ? Center(
                                child: Image.asset(
                                  Images.emptyNotifications,
                                  width: 150,
                                ),
                              )
                            : ListView.builder(
                                itemCount: state.notifications.length,
                                itemBuilder: (context, index) => _AlertListItem(
                                  notification: state.notifications[index],
                                ),
                              ))
              ],
            )));
  }
}

class _AlertListItem extends StatelessWidget {
  const _AlertListItem({Key? key, required this.notification})
      : super(key: key);
  final not.Notification notification;
  @override
  Widget build(BuildContext context) {
    final title =
        notification.notificationType == not.NotificationType.outDatedTask
            ? AppLocalizations.of(context)!.outDatedTask
            : AppLocalizations.of(context)!.taskWarning;
    final notificationColor =
        notification.notificationType == not.NotificationType.outDatedTask
            ? Colors.red
            : AppColors.aquamarine;
    return ListTile(
      leading: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: notificationColor, borderRadius: BorderRadius.circular(8.5)),
        height: 24,
        width: 24,
        child: Image.asset(
          Images.alertIcon,
          width: 4,
          height: 11,
        ),
      ),
      title: Text("$title : ${notification.body}",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontWeight: FontWeight.w200,
            fontSize: 12,
            height: 2,
          )),
    );
  }
}
