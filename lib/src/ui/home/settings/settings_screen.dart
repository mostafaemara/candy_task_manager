import 'package:flutter/material.dart';
import 'package:task_manger/src/ui/common/check_box_list_tile.dart';

import 'package:task_manger/src/ui/common/custom_app_bar.dart';
import 'package:task_manger/src/ui/common/header.dart';
import 'package:task_manger/src/ui/common/subtitle.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
            title: AppLocalizations.of(context)!.settings.toUpperCase(),
            actions: const []),
        Header(title: AppLocalizations.of(context)!.settings),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 32, end: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Subtitle(title: AppLocalizations.of(context)!.language),
              const SizedBox(
                height: 16,
              ),
              const ListTile(
                title: Subtitle(title: "English"),
                trailing: Icon(Icons.language),
              ),
              const ListTile(
                title: Subtitle(title: "العربية"),
                trailing: Icon(Icons.language),
              ),
              CheckBoxListTile(
                title: AppLocalizations.of(context)!.darkTheme,
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
