import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_with_clean/core/constants/movieapi/api_constants.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/pages/overview_page.dart';

class GridViewWidget extends ConsumerWidget {
  final List<MovieEntity> data;
  final images = ApiConstants.imagePath;
  const GridViewWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 360,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              mainAxisExtent: 200,
              crossAxisSpacing: 5),
          itemCount: 6,
          itemBuilder: (context, index) {
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    // boxShadow: const [
                    //   BoxShadow(
                    //     color: Colors.black,
                    //     blurRadius: 0.50,
                    //   )
                    // ]
                  ),
                  // color: AppTheme.of(context).colors.fieldText,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:image,
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        data[index].title,
                        style: GoogleFonts.mohave(
                            fontWeight: FontWeight.w600, color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
