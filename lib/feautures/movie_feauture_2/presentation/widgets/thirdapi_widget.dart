import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_clean/core/constants/movieapi/api_constants.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/pages/overview_page.dart';

class ListViewWidget extends StatelessWidget {
  final List<MovieEntity> data;
  final image = ApiConstants.imagePath;
  const ListViewWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            context.push(OverViewPage.routePath, extra: data[index]);
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image + data[index].backdropPath),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
              color: Colors.amber,
            ),
            width: 100,
            height: 80,
          ),
        ),
      ),
    );
  }
}
