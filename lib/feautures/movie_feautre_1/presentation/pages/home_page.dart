import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_clean/core/constants/home_constants.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/authentication/sighup_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/providers/auth_provider.dart';

class HomePage extends ConsumerWidget {
  static const routerPath = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theme.colors.primary,
        title: Text(
          HomeConstants.appName,
          style: TextStyle(color: theme.colors.text),
        ),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(authenticationProvider(context).notifier).sighnOut();
                context.go(SignUpHome.routerPath);
              },
              icon: Icon(
                Icons.logout,
                color: theme.colors.secondary,
              ))
        ],
      ),
    );
  }
}
