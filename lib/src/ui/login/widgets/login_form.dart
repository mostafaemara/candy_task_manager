import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_manger/src/bloc/login/login_cubit.dart';
import 'package:task_manger/src/bloc/submission_state.dart';
import 'package:task_manger/src/routes/app_router.dart';
import 'package:task_manger/src/ui/common/custom_text_button.dart';
import 'package:task_manger/src/ui/common/email_form_field.dart';
import 'package:task_manger/src/ui/common/form_field_label.dart';
import 'package:task_manger/src/ui/common/form_title.dart';
import 'package:task_manger/src/ui/common/password_form_field.dart';
import 'package:task_manger/src/ui/common/submit_button.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, SubmissionState>(
        builder: (context, state) => state.submissionStatus ==
                SubmissionStatus.submitting
            ? const CircularProgressIndicator()
            : Form(
                key: _key,
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
                        child: FormTitle(
                            title: AppLocalizations.of(context)!.login)),
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
                        FormFieldLabel(
                            label: AppLocalizations.of(context)!.password),
                        CustomTextButton(
                            onPressed: () {},
                            label:
                                AppLocalizations.of(context)!.forgotPassword),
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
                      onPressed: () => _handleSubmission(context),
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
                )),
        listener: (context, state) {
          _handelLoginState(context, state);
        });
  }

  void _handleSubmission(BuildContext context) {
    if (_key.currentState!.validate()) {
      _key.currentState?.save();
      context
          .read<LoginCubit>()
          .login(_emailController.text, _passwordController.text);
    }
  }
}

void _handelLoginState(BuildContext context, SubmissionState state) {
  if (state.submissionStatus == SubmissionStatus.success) {
    AutoRouter.of(context).navigate(const HomeRoute());
  }

  if (state.submissionStatus == SubmissionStatus.error) {
    _showError(context, state.error);
  }
}

void _showError(BuildContext context, String error) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
}
