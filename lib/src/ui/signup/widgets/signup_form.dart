import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_manger/src/bloc/signup/signup_cubit.dart';
import 'package:task_manger/src/bloc/submission_state.dart';
import 'package:task_manger/src/routes/app_router.dart';
import 'package:task_manger/src/ui/common/custom_text_button.dart';
import 'package:task_manger/src/ui/common/email_form_field.dart';
import 'package:task_manger/src/ui/common/form_field_label.dart';
import 'package:task_manger/src/ui/common/form_title.dart';
import 'package:task_manger/src/ui/common/password_form_field.dart';
import 'package:task_manger/src/ui/common/submit_button.dart';
import 'package:task_manger/src/ui/signup/widgets/confirm_password_form_field.dart';

class SignupForm extends StatelessWidget {
  SignupForm({Key? key}) : super(key: key);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SubmissionState>(
        builder: (context, state) => state.submissionStatus ==
                SubmissionStatus.submitting
            ? const CircularProgressIndicator()
            : Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 26,
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: FormTitle(
                            title: AppLocalizations.of(context)!.register)),
                    const Spacer(),
                    FormFieldLabel(label: AppLocalizations.of(context)!.email),
                    const SizedBox(
                      height: 8,
                    ),
                    EmailFormField(controller: _emailController),
                    const SizedBox(
                      height: 8,
                    ),
                    FormFieldLabel(
                        label: AppLocalizations.of(context)!.password),
                    const SizedBox(
                      height: 8,
                    ),
                    PassowrdFormField(controller: _passwordController),
                    const SizedBox(
                      height: 8,
                    ),
                    FormFieldLabel(
                        label: AppLocalizations.of(context)!.confirmPassword),
                    const SizedBox(
                      height: 8,
                    ),
                    ConfirmPasswordFormField(
                        controller: _confirmPasswordController,
                        passwordController: _passwordController),
                    const SizedBox(
                      height: 40,
                    ),
                    SubmitButton(
                        onPressed: () => _handleSubmission(context),
                        label: AppLocalizations.of(context)!.register),
                    const SizedBox(
                      height: 30,
                    ),
                    const _TermsAndPoliciesText(),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: CustomTextButton(
                          onPressed: () {
                            AutoRouter.of(context).replace(const LoginRoute());
                          },
                          label: AppLocalizations.of(context)!.haveAccount),
                    ),
                    const Spacer(),
                  ],
                )),
        listener: (_, state) {
          _handelSubmissionState(context, state);
        });
  }

  void _handleSubmission(BuildContext context) {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
      context
          .read<SignupCubit>()
          .signup(_emailController.text, _confirmPasswordController.text);
    }
  }

  void _handelSubmissionState(BuildContext context, SubmissionState state) {
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
}

class _TermsAndPoliciesText extends StatelessWidget {
  const _TermsAndPoliciesText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO change to clickable
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Text(
        AppLocalizations.of(context)!.termsAndPolicies,
        style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        textAlign: TextAlign.center,
      ),
    );
  }
}
