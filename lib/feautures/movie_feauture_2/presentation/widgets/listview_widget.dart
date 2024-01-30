import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/genre_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/pages/action_movie_page.dart';

class GenereListWidget extends StatelessWidget {
  final List<GenreEntity> data;
  const GenereListWidget({super.key, required this.data});

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
            child: Container(
              width: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: theme.colors.fieldText),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data[index].name),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
