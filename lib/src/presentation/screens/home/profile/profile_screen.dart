import 'package:flutter/material.dart';
import 'package:task_manger/src/presentation/common/custom_app_bar.dart';
import 'package:task_manger/src/presentation/screens/home/profile/widgets/subtitle.dart';

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
            trailing: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  Images.noteIcon,
                  height: 24,
                  width: 24,
                ))),
        const ProfileHeader(),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 32, end: 16),
          child: Column(
            children: const [Subtitle(title: "Notification Setting")],
          ),
        )
      ],
    );
  }
}
