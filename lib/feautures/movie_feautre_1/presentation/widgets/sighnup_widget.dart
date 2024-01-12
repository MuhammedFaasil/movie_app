import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/providers/auth_provider.dart';

class SighnUpButtonWidget extends ConsumerWidget {
  final String text;
  const SighnUpButtonWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.read(authenticationProvider.notifier).emailControler;
    final password =
        ref.read(authenticationProvider.notifier).passwordControler;

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(MediaQuery.sizeOf(context).width / 1.1,
                AppTheme.of(context).spaces.space_700),
            backgroundColor: AppTheme.of(context).colors.secondary),
        onPressed: () {
          ref
              .read(authenticationProvider.notifier)
              .sighnUpWithEmail(email.text, password.text);
          ref.read(authenticationProvider.notifier).clear();
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
