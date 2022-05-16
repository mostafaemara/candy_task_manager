import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/src/bloc/config/config_cubit.dart';
import 'package:task_manger/src/bloc/config/config_state.dart';
import 'package:task_manger/src/data/model/language.dart';
import 'package:task_manger/src/ui/common/check_box_list_tile.dart';
import "package:task_manger/src/data/model/theme_mode.dart" as app;
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
        BlocBuilder<ConfigCubit, ConfigState>(
          builder: (context, state) => Padding(
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
                ListTile(
                  onTap: () {
                    context
                        .read<ConfigCubit>()
                        .changeLanguage(Language.english);
                  },
                  selected: state.language == Language.english,
                  textColor: Theme.of(context).colorScheme.primary,
                  iconColor: Theme.of(context).colorScheme.primary,
                  selectedColor: Theme.of(context).colorScheme.secondary,
                  title: const Text("English"),
                  trailing: const Icon(Icons.language),
                ),
                ListTile(
                  onTap: () {
                    context.read<ConfigCubit>().changeLanguage(Language.arabic);
                  },
                  textColor: Theme.of(context).colorScheme.primary,
                  iconColor: Theme.of(context).colorScheme.primary,
                  selected: state.language == Language.arabic,
                  selectedColor: Theme.of(context).colorScheme.secondary,
                  title: const Text("العربية"),
                  trailing: const Icon(Icons.language),
                ),
                CheckBoxListTile(
                  title: AppLocalizations.of(context)!.darkTheme,
                  onChange: context.read<ConfigCubit>().onToggleThemeMode,
                  value: state.themeMode == app.ThemeMode.dark,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
