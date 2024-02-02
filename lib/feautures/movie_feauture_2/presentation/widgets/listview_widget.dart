import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/genre_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/pages/action_movie_page.dart';

class GenereListWidget extends StatelessWidget {
  final List<GenreEntity> data;
  final List images = [
    'asset/image/John-Wick-Chapter-2-ilm-Review-BTG-Lifestyle.jpg',
    'asset/image/adventure.jpeg',
    'asset/image/animation.jpeg',
    'asset/image/comedy.jpg',
    'asset/image/crime.jpg',
    'asset/image/documentary.jpeg',
    'asset/image/drama.jpeg',
    'asset/image/family.jpg',
    'asset/image/fantacy.jpg',
    'asset/image/history.png',
    'asset/image/horror.jpeg',
    'asset/image/music.jpeg',
    'asset/image/mystry.jpg',
    'asset/image/romance.jpg',
    'asset/image/scifi.jpg',
    'asset/image/tvshows.jpeg',
    'asset/image/thriller.jpg',
    'asset/image/war.jpg',
    'asset/image/western.jpeg'
  ];
  GenereListWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return SizedBox(
      height: 80,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 5,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            context.push(ActionMoviesPage.routePath, extra: data[index]);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: SizedBox(
              height: 100,
              child: Column(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(20),
                        color: theme.colors.fieldText),
                  ),
                  Text(
                    data[index].name,
                    style: GoogleFonts.mohave(color: theme.colors.text),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
