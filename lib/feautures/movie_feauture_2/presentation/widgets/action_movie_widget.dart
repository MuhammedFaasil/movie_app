import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_with_clean/core/constants/movieapi/api_constants.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/pages/action_movie_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/pages/overview_page.dart';

class ActionGridWidget extends StatelessWidget {
  final List<MovieEntity> data;
  final image = ApiConstants.imagePath;
  const ActionGridWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            mainAxisExtent: 200,
            crossAxisSpacing: 5),
        itemCount: data.length,
        itemBuilder: (context, index) => InkWell(
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
                          image: NetworkImage(image + data[index].posterPath),
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
        ),
      ),
    );
  }
}
