import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_clean/core/constants/authentication/login_constants.dart';
import 'package:movie_app_with_clean/core/constants/authentication/phone_login_constants.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/authentication/login_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/widgets/loginimage_width.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/widgets/otpbutton_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/widgets/pagenavigation_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/widgets/textfield_widget.dart';

class PhoneLoginPage extends HookConsumerWidget {
  static const routePath = '/phonelogin';
  const PhoneLoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mobileControler = useTextEditingController();
    final data = ref.watch(loginConstantsProvider);
    final theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: theme.colors.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GoogleImageWidget(
                  height: 150, width: 130, googleLogo: data.moviLogo,fit: BoxFit.cover,),
              // Text(
              //   data.appName,
              //   style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
              // ),
              SizedBox(
                height: theme.spaces.space_800 ,
              ),
              TextFieldWidget(
                  labelText: PhoneLoginConstants.fieldText,
                  icons: Icon(Icons.phone),
                  controller: mobileControler),
              SizedBox(
                height: theme.spaces.space_400,
              ),
              OtpButtonWidget(
                otpControler: mobileControler,
              ),
              SizedBox(
                height: theme.spaces.space_800 * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(PhoneLoginConstants.backText),
                  SighnInOrUpWidget(
                      label: PhoneLoginConstants.logText,
                      onPressed: () {
                        context.push(LoginHome.routerPath);
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
