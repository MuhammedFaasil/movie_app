import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_clean/core/constants/authentication/phone_login_constants.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/authentication/otp_verification_page.dart';

class OtpButtonWidget extends ConsumerWidget {
  const OtpButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(MediaQuery.sizeOf(context).width / 1.1,
                AppTheme.of(context).spaces.space_700),
            backgroundColor: AppTheme.of(context).colors.secondary),
        onPressed: () {
          context.go(OtpVerficationPage.routePath);
        },
        child: Text(
          PhoneLoginConstants.buttonText,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ));
  }
}
