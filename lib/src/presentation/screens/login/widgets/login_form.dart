import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task_manger/src/presentation/common/custom_text_button.dart';
import 'package:task_manger/src/presentation/common/email_form_field.dart';
import 'package:task_manger/src/presentation/common/form_field_label.dart';
import 'package:task_manger/src/presentation/common/form_title.dart';
import 'package:task_manger/src/presentation/common/password_form_field.dart';
import 'package:task_manger/src/presentation/common/submit_button.dart';
import 'package:task_manger/src/presentation/routes/app_router.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 26,
        ),
        Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: FormTitle(title: AppLocalizations.of(context)!.login)),
        const Spacer(),
        FormFieldLabel(label: AppLocalizations.of(context)!.email),
        const SizedBox(
          height: 8,
        ),
        EmailFormField(controller: _emailController),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FormFieldLabel(label: AppLocalizations.of(context)!.password),
            CustomTextButton(
                onPressed: () {},
                label: AppLocalizations.of(context)!.forgotPassword),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        PassowrdFormField(controller: _passwordController),
        const SizedBox(
          height: 40,
        ),
        SubmitButton(
          onPressed: () {
            AutoRouter.of(context).replace(const HomeRoute());
          },
          label: AppLocalizations.of(context)!.login,
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: double.infinity,
          child: CustomTextButton(
              onPressed: () {
                AutoRouter.of(context).replace(const SignupRoute());
              },
              label: AppLocalizations.of(context)!.newUserRegister),
        ),
        const Spacer(),
      ],
    ));
  }
}
