import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_with_clean/core/constants/home_constants.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/providers/movie_provider.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/widgets/action_movie_widget.dart';

class ActionMoviesPage extends ConsumerWidget {
  static const routePath = '/action';
  final MovieEntity entity;
  const ActionMoviesPage({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0.2,
          backgroundColor: theme.colors.primary,
          title: Text(
            HomeConstants.actionText,
            style: GoogleFonts.mohave(color: theme.colors.text),
          ),
          leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: theme.colors.text,
              )),
        ),
        body: switch (ref.watch(movieApiProvider)) {
          AsyncData(:final value) => SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: theme.spaces.space_200,
                  ),
                  ActionGridWidget(data: value.actionMovies)
                ],
              ),
            ),
          AsyncError() => Center(
              child: TextButton(
                onPressed: () {
                  ref.invalidate(movieApiProvider);
                },
                child: const Text('Retry'),
              ),
            ),
          _ => const Center(
              child: CircularProgressIndicator(),
            )
        });
  }
}
