import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/providers/auth_provider.dart';

class SighnUpButtonWidget extends ConsumerWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String text;
  const SighnUpButtonWidget({super.key, required this.text,required this.emailController,required this.passwordController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(MediaQuery.sizeOf(context).width / 1.1,
                AppTheme.of(context).spaces.space_700),
            backgroundColor: AppTheme.of(context).colors.secondary),
        onPressed: () {
          ref
              .read(authenticationProvider(context).notifier)
              .sighnUpWithEmail(emailController.text, passwordController.text);
         
        },
        child: Text(
          text,
          style: TextStyle(
              fontSize: 20,
              color: AppTheme.of(context).colors.primary,
              fontWeight: FontWeight.bold),
        ));
  }
}
