import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_clean/core/constants/authentication/phone_login_constants.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/providers/auth_provider.dart';

class OtpButtonWidget extends ConsumerWidget {
  final TextEditingController otpControler;
  const OtpButtonWidget({super.key, required this.otpControler});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(MediaQuery.sizeOf(context).width / 1.1,
                AppTheme.of(context).spaces.space_700),
            backgroundColor: AppTheme.of(context).colors.secondary),
        onPressed: () {
          ref
              .read(authenticationProvider.notifier)
              .signInWithPhone(context, otpControler.text);
          // context.go(OtpVerficationPage.routePath);
        },
        child: Text(
          PhoneLoginConstants.buttonText,
          style:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ));
  }
}
