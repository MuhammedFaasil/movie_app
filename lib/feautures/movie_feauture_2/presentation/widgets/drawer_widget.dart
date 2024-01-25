import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/authentication/sighup_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/providers/auth_provider.dart';

class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppTheme.of(context).colors.fieldText,
            ),
            child: Center(
                child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: AppTheme.of(context).colors.secondary,
                  radius: 30,
                ),
                SizedBox(
                  height: AppTheme.of(context).spaces.space_150,
                ),
                const Text('User')
              ],
            )),
          ),
          ListTile(
            title: const Text('App Theme'),
            leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.light,
                  color: AppTheme.of(context).colors.secondary,
                )),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Logout'),
            leading: IconButton(
                onPressed: () {
                  ref.read(authenticationProvider.notifier).sighnOut(context);
                  context.go(SignUpHome.routerPath);
                },
                icon: Icon(
                  Icons.logout,
                  color: AppTheme.of(context).colors.secondary,
                )),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
