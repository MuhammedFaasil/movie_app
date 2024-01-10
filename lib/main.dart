import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_clean/core/theme/light_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/login_page.dart';

void main() {
  runApp(const ProviderScope(child:  MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return  MaterialApp(
      title: 'Flutter Demo',
      theme: ref.watch(lightThemeProvider),
      debugShowCheckedModeBanner: false,
      home:const LoginHome(),
    );
  }
}
