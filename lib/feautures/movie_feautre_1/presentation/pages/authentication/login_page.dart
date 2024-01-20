import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_clean/core/constants/authentication/login_constants.dart';
import 'package:movie_app_with_clean/core/constants/authentication/sighnup_constants.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/authentication/phone_login_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/authentication/sighup_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/providers/auth_provider.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/widgets/forgetbutton_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/widgets/loginimage_width.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/widgets/loginbutton_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/widgets/pagenavigation_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/widgets/textfield_widget.dart';

class LoginHome extends HookConsumerWidget {
  static const routerPath = '/login';
  const LoginHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailControler = useTextEditingController();
    final passwordControler = useTextEditingController();
    final data = ref.watch(loginConstantsProvider);
    final sighn = ref.watch(sighnUpConstantsProvider);
    final theme = AppTheme.of(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GoogleImageWidget(
                height: 150,
                width: 130,
                googleLogo: data.moviLogo,
                fit: BoxFit.cover,
              ),
              // Text(
              //   data.appName,
              //   style:
              //       const TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
              // ),
              SizedBox(
                height: theme.spaces.space_800
                
                
                
                ,
              ),
              TextFieldWidget(
                controller: emailControler,
                labelText: data.userNameText,
                icons: const Icon(Icons.person),
              ),
              SizedBox(
                height: theme.spaces.space_150,
              ),
              TextFieldWidget(
                controller: passwordControler,
                labelText: data.passwordText,
                icons: const Icon(Icons.lock),
              ),
              ForgetButtonWidget(
                controller: emailControler,
              ),
              SizedBox(
                height: theme.spaces.space_400,
              ),
              LoginButtonWidget(
                emailControler: emailControler,
                passWordControler: passwordControler,
                text: data.loginText,
              ),
              SizedBox(
                height: AppTheme.of(context).spaces.space_800,
              ),
              Text(
                data.continutext,
                style: TextStyle(color: theme.colors.textSubtlest),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      ref
                          .read(authenticationProvider.notifier)
                          .signWithGoogle(context);
                    },
                    child: GoogleImageWidget(
                      width: 100,
                      height: 80,
                      googleLogo: data.googleLogo,
                      fit: BoxFit.contain,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.go(PhoneLoginPage.routePath);
                    },
                    child: GoogleImageWidget(
                      height: 55,
                      width: 100,
                      googleLogo: data.phoneImage,
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.otherLogin,
                    style: TextStyle(color: theme.colors.textSubtlest),
                  ),
                  SighnInOrUpWidget(
                    label: sighn.signUp,
                    onPressed: () {
                      context.go(SignUpHome.routerPath);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
