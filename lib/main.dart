import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_clean/core/objectbox/action_objectbox.dart';
import 'package:movie_app_with_clean/core/objectbox/movie_objectbox.dart';
import 'package:movie_app_with_clean/core/objectbox/popular_objectbox.dart';
import 'package:movie_app_with_clean/core/objectbox/toprated_objectbox.dart';
import 'package:movie_app_with_clean/core/router/router.dart';
import 'package:movie_app_with_clean/core/theme/light_theme.dart';
import 'package:movie_app_with_clean/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MovieObjectBox.create();
  await PopularObjectBox.create();
  await TopRatedObjectBox.create();
  await ActionObjectBox.create();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ref.watch(lightThemeProvider),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
