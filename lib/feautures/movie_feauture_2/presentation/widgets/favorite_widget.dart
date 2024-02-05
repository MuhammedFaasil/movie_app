import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_with_clean/core/constants/movieapi/api_constants.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/pages/overview_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/providers/movie_provider.dart';

class FavouriteWidget extends ConsumerWidget {
  final List<MovieEntity> value;
  final image = ApiConstants.imagePath;
  final int itemCount;
  const FavouriteWidget(
      {super.key, required this.value, required this.itemCount});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: InkWell(
          onTap: () {
            context.push(OverViewPage.routePath, extra: value[index]);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppTheme.of(context).colors.fieldText.withOpacity(0.40),
            ),
            width: MediaQuery.sizeOf(context).width,
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 130,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(image + value[index].posterPath),
                          fit: BoxFit.fill),
                      color: Colors.amber),
                ),
                SizedBox(
                  width: theme.spaces.space_125,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: Text(
                        value[index].title,
                        // textAlign: TextAlign.center,
                        style: GoogleFonts.mohave(
                            color: theme.colors.text,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      '⭐${value[index].voteAverage.toString()}',
                      style: GoogleFonts.mohave(
                          color: theme.colors.text,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      ref
                          .read(movieApiProvider.notifier)
                          .deleteFireStore(value[index].id.toString());
                    },
                    icon: const Icon(Icons.delete))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
