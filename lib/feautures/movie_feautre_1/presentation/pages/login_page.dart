import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_clean/core/constants/login/login_constants.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/widgets/forgetbutton_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/widgets/googleimage_width.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/widgets/loginbutton_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/widgets/textfield_widget.dart';

class LoginHome extends ConsumerWidget {
  const LoginHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(loginConstantsProvider);
    final theme = AppTheme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data.appName,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: theme.spaces.space_800,
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
            LoginButtonWidget(),
            SizedBox(
              height: AppTheme.of(context).spaces.space_800,
            ),
            Text(
              data.otherLogin,
              style: TextStyle(color: theme.colors.textSubtlest),
            ),
            GoogleImageWidget()
          ],
        ),
      ),
    );
  }
}
