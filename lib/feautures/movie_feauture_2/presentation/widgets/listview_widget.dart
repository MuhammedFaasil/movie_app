import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_clean/core/constants/home_constants.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/pages/action_movie_page.dart';

class GenereListWidget extends StatelessWidget {
  final List<MovieEntity> data;
  List<Icon> icons = [
    const Icon(Icons.sports_gymnastics_outlined),
    const Icon(Icons.movie_creation_outlined),
    const Icon(Icons.theater_comedy_outlined),
    const Icon(Icons.theater_comedy),
    const Icon(Icons.girl)
  ];
  GenereListWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return SizedBox(
      height: 80,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            context.push(ActionMoviesPage.routePath, extra: data[index]);
          },
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: theme.colors.fieldText),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icons[index],
                Text(HomeConstants.text[index]),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
