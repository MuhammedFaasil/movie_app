import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_clean/core/theme/light_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/login_page.dart';
import 'package:movie_app_with_clean/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ref.watch(lightThemeProvider),
      debugShowCheckedModeBanner: false,
      home: const LoginHome(),
    );
  }
}
