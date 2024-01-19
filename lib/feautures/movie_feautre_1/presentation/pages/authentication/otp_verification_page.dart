import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_clean/core/constants/authentication/login_constants.dart';
import 'package:movie_app_with_clean/core/constants/authentication/phone_login_constants.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/widgets/confirm_otp_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/widgets/loginimage_width.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/widgets/textfield_widget.dart';

class OtpVerficationPage extends HookConsumerWidget {
  static const routePath = '/otppage';
  const OtpVerficationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mobileControler = useTextEditingController();
    final data = ref.watch(loginConstantsProvider);
    final theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: theme.colors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GoogleImageWidget(
                height: 80, width: 100, googleLogo: data.moviLogo,fit: BoxFit.cover,),
            Text(
              data.appName,
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: theme.spaces.space_500,
            ),
            TextFieldWidget(
                labelText: PhoneLoginConstants.otpText,
                icons: Icon(Icons.lock),
                controller: mobileControler),
            SizedBox(
              height: theme.spaces.space_400,
            ),
            ConfirmOtpWidget(),
            SizedBox(
              height: theme.spaces.space_500 * 2,
            ),
          ],
        ),
      ),
    );
  }
}
