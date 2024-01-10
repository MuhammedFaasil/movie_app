import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_clean/core/constants/login/login_constants.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';

class LoginButtonWidget extends ConsumerWidget {
  LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(MediaQuery.sizeOf(context).width / 1.1,
                AppTheme.of(context).spaces.space_700),
            backgroundColor: AppTheme.of(context).colors.secondary),
        onPressed: () {},
        child: Text(
          ref.watch(loginConstantsProvider).loginText,
          style: TextStyle(
              fontSize: 20,
              color: AppTheme.of(context).colors.primary,
              fontWeight: FontWeight.bold),
        ));
  }
}
