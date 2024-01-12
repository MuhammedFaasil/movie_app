import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_clean/core/constants/authentication/login_constants.dart';
import 'package:movie_app_with_clean/core/constants/authentication/sighnup_constants.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/providers/auth_provider.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/widgets/loginimage_width.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/widgets/pagenavigation_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/widgets/sighnup_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/widgets/textfield_widget.dart';

class SignUpHome extends ConsumerWidget {
  const SignUpHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(loginConstantsProvider);
    final sighn = ref.watch(sighnUpConstantsProvider);
    final theme = AppTheme.of(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GoogleImageWidget(googleLogo: data.moviLogo),
              Text(
                data.appName,
                style:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: theme.spaces.space_200,
              ),
              TextFieldWidget(
                controller: ref.read(authenticationProvider.notifier).nameControler,
                  labelText: sighn.nameText, icons: Icon(Icons.person)),
              SizedBox(
                height: theme.spaces.space_200,
              ),
              TextFieldWidget(
                 controller: ref.read(authenticationProvider.notifier).mobileControler,
                  labelText: sighn.numberText, icons: Icon(Icons.phone)),
              SizedBox(
                height: theme.spaces.space_200,
              ),
              TextFieldWidget(
                 controller: ref.read(authenticationProvider.notifier).emailControler,
                  labelText: sighn.emailText,
                  icons: Icon(Icons.email_outlined)),
              SizedBox(
                height: theme.spaces.space_200,
              ),
              TextFieldWidget(
                 controller: ref.read(authenticationProvider.notifier).passwordControler,
                  labelText: sighn.passwordText,
                  icons: Icon(Icons.lock_open_outlined)),
              SizedBox(
                height: theme.spaces.space_200 * 2,
              ),
              SighnUpButtonWidget(text: sighn.signUp),
              SizedBox(
                height: theme.spaces.space_200 * 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    sighn.haveAccount,
                    style: TextStyle(color: theme.colors.textSubtlest),
                  ),
                  SighnInOrUpWidget(
                    label: data.loginText,
                    onPressed: () {
                      Navigator.pop(context);
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
