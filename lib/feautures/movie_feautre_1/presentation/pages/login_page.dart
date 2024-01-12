import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_clean/core/constants/authentication/login_constants.dart';
import 'package:movie_app_with_clean/core/constants/authentication/sighnup_constants.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/sighup_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/widgets/forgetbutton_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/widgets/loginimage_width.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/widgets/loginbutton_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/widgets/pagenavigation_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/widgets/textfield_widget.dart';

class LoginHome extends ConsumerWidget {
  const LoginHome({super.key});

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
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: theme.spaces.space_800 * 2,
              ),
              TextFieldWidget(
                labelText: data.userNameText,
                icons: const Icon(Icons.person),
              ),
              SizedBox(
                height: theme.spaces.space_150,
              ),
              TextFieldWidget(
                labelText: data.passwordText,
                icons: const Icon(Icons.lock),
              ),
              const ForgetButtonWidget(),
              SizedBox(
                height: theme.spaces.space_400,
              ),
              LoginButtonWidget(
                text: data.loginText,
              ),
              SizedBox(
                height: AppTheme.of(context).spaces.space_800,
              ),
              Text(
                data.continutext,
                style: TextStyle(color: theme.colors.textSubtlest),
              ),
              InkWell(
                onTap: () {},
                child: GoogleImageWidget(
                  googleLogo: data.googleLogo,
                ),
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
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SignUpHome();
                        },
                      ));
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
