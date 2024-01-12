import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_clean/core/constants/authentication/login_constants.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';

class ForgetButtonWidget extends ConsumerWidget {
  const ForgetButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        width: MediaQuery.sizeOf(context).width / 1.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {},
                child: Text(
                  ref.watch(loginConstantsProvider).buttonText,
                )),
          ],
        ));
  }
}
