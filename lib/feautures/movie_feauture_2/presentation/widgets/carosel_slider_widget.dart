import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_clean/core/constants/movieapi/api_constants.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/pages/overview_page.dart';

class CaroselWidget extends ConsumerWidget {
  final List<MovieEntity> data;
  final image = ApiConstants.imagePath;
  const CaroselWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CarouselSlider.builder(
        itemCount: data.length,
        itemBuilder: (context, index, realIndex) {
          return InkWell(
            onTap: () {
              context.push(OverViewPage.routePath, extra: data[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image + data[index].posterPath),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey),
            ),
          );
        },
        options: CarouselOptions(
          height: 400,
          aspectRatio: 16 / 9,
          viewportFraction: 0.7,
          initialPage: 0,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 4),
          autoPlayAnimationDuration: Duration(milliseconds: 2000),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          // onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ));
  }
}
