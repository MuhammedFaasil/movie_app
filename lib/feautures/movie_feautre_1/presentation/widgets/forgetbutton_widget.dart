import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_clean/core/constants/authentication/login_constants.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/providers/auth_provider.dart';

class ForgetButtonWidget extends ConsumerWidget {
  final TextEditingController controller;
  const ForgetButtonWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        width: MediaQuery.sizeOf(context).width / 1.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {
                  ref
                      .read(authenticationProvider.notifier)
                      .passwordReset(context,controller.text);
                },
                child: Text(
                  ref.watch(loginConstantsProvider).buttonText,
                  style:
                      TextStyle(color: AppTheme.of(context).colors.secondary),
                )),
          ],
        ));
  }
}
