import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_with_clean/core/constants/home_constants.dart';
import 'package:movie_app_with_clean/core/constants/movieapi/api_constants.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/pages/overview_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/providers/movie_provider.dart';

class SearchMoviePage extends ConsumerWidget {
  static const routePath = '/search';
  final image = ApiConstants.imagePath;

  const SearchMoviePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0.2,
          backgroundColor: theme.colors.primary,
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: theme.colors.text,
            ),
          ),
          title: Text(
            HomeConstants.serHome,
            style: GoogleFonts.mohave(color: theme.colors.text),
          ),
        ),
        body: ref.watch(movieApiProvider).when(
              data: (data) => GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisExtent: 340,
                    mainAxisSpacing: 10),
                itemCount: data.search!.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    context.push(OverViewPage.routePath,
                        extra: data.search![index]);
                  },
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Container(
                            height: 260,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        image + data.search![index].posterPath),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            'Movie : ${data.search![index].title}',
                            style: GoogleFonts.mohave(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              error: (error, stackTrace) => Center(
                child: Text(error.toString()),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }
}
