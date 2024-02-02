import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_with_clean/core/constants/home_constants.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/providers/movie_provider.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/widgets/favorite_widget.dart';

class FavouritePage extends ConsumerWidget {
  static const routePath = '/favourite';
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0.2,
          iconTheme: IconThemeData(color: theme.colors.text),
          backgroundColor: theme.colors.primary,
          title: Text(
            HomeConstants.favorTxt,
            style: GoogleFonts.mohave(
                color: theme.colors.text,
                fontWeight: FontWeight.w600,
                fontSize: 22),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: StreamBuilder(
                    stream:
                        ref.read(movieApiProvider.notifier).getMovieFromStore(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return FavouriteWidget(
                          value: snapshot.data!,
                          itemCount: snapshot.data!.length,
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              )
            ],
          ),
        ));
  }
}
