import 'package:flutter/material.dart';
import 'package:task_manger/src/presentation/common/custom_app_bar.dart';
import 'package:task_manger/src/presentation/common/check_box_list_tile.dart';
import 'package:task_manger/src/presentation/common/subtitle.dart';

import '../../../utils/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'widgets/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
            title: AppLocalizations.of(context)!.profile.toUpperCase(),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    Images.noteIcon,
                    height: 24,
                    width: 24,
                  ))
            ]),
        const ProfileHeader(),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 32, end: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Subtitle(title: "Notification Setting"),
              const SizedBox(
                height: 16,
              ),
              CheckBoxListTile(
                title: "Get email notifications",
                onChange: (v) {},
                value: true,
              ),
              CheckBoxListTile(
                title: "Vibrate on alert",
                onChange: (v) {},
                value: true,
              ),
              const SizedBox(
                height: 26,
              ),
              const Subtitle(title: "Floss Settings"),
              const SizedBox(
                height: 16,
              ),
              CheckBoxListTile(
                title: "Share profile with other floss users",
                onChange: (v) {},
                value: true,
              ),
              CheckBoxListTile(
                title: "Show your task completion status",
                onChange: (v) {},
                value: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
