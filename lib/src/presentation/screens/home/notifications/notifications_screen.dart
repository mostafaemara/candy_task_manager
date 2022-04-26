import 'package:flutter/material.dart';

import 'package:task_manger/src/presentation/common/custom_app_bar.dart';
import 'package:task_manger/src/presentation/common/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_manger/src/presentation/common/menu_button.dart';
import 'package:task_manger/src/presentation/common/search_button.dart';
import 'package:task_manger/src/presentation/styles/colors.dart';
import 'package:task_manger/src/presentation/utils/images.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  static var todos = [
    {
      "title": "todo title",
      "isCompleted": true,
    },
    {
      "title": "todo title",
      "isCompleted": false,
    },
    {
      "title": "todo title",
      "isCompleted": true,
    },
    {
      "title": "todo title",
      "isCompleted": true,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: [
        CustomAppBar(
          actions: [SearchButton(onPressed: () {})],
          leading: MenuButton(onPressed: () {}),
          title: AppLocalizations.of(context)!.notifications.toUpperCase(),
        ),
        Header(title: AppLocalizations.of(context)!.alerts),
        Expanded(
            child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) =>
              _AlertListItem(title: todos[index]["title"].toString()),
        ))
      ],
    ));
  }
}

class _AlertListItem extends StatelessWidget {
  const _AlertListItem({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.aquamarine,
            borderRadius: BorderRadius.circular(8.5)),
        height: 24,
        width: 24,
        child: Image.asset(
          Images.alertIcon,
          width: 4,
          height: 11,
        ),
      ),
      title: Text(title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontWeight: FontWeight.w200,
            fontSize: 12,
            height: 2,
          )),
    );
  }
}
