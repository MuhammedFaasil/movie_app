import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_clean/core/constants/authentication/login_constants.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';

class LoginButtonWidget extends ConsumerWidget {
  final String text;
  LoginButtonWidget({super.key,required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(MediaQuery.sizeOf(context).width / 1.1,
                AppTheme.of(context).spaces.space_700),
            backgroundColor: AppTheme.of(context).colors.secondary),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
              fontSize: 20,
              color: AppTheme.of(context).colors.primary,
              fontWeight: FontWeight.bold),
        ));
  }
}
