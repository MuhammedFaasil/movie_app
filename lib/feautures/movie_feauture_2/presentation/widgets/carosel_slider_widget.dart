import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_clean/core/constants/movieapi/api_constants.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/pages/overview_page.dart';

class CaroselWidget extends ConsumerWidget {
  final List<MovieEntity> data;
  final images = ApiConstants.imagePath;
  const CaroselWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CarouselSlider.builder(
        itemCount: data.length,
        itemBuilder: (context, index, realIndex) {
          final posterPathFile = File(data[index].posterPath);
          late final ImageProvider image;
          if (posterPathFile.existsSync()) {
            image = FileImage(posterPathFile);
          } else {
            image = NetworkImage(images + data[index].posterPath);
          }
          return InkWell(
            onTap: () {
              context.push(OverViewPage.routePath, extra: data[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: image, fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey),
            ),
          );
        },
        options: CarouselOptions(
          height: 350,
          aspectRatio: 16 / 9,
          viewportFraction: 0.9,
          initialPage: 0,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 4),
          autoPlayAnimationDuration: Duration(milliseconds: 2500),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          // onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ));
  }
}
