import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
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
      height: 210,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (context, index) => const SizedBox(
          width: 0,
        ),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            context.push(OverViewPage.routePath, extra: data[index]);
          },
          child: Container(
            width: 135,
            height: 190,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(image + data[index].posterPath),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amber,
                    ),
                    width: 120,
                    height: 160,
                  ),
                  Text(
                    data[index].originalTitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.mohave(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
