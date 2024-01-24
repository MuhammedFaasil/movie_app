import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_with_clean/core/constants/home_constants.dart';
import 'package:movie_app_with_clean/core/constants/movieapi/api_constants.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/widgets/positiond_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/widgets/watch_and_view_widget.dart';

class OverViewPage extends StatelessWidget {
  static const routePath = '/overview';
  final MovieEntity entity;
  const OverViewPage({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.fieldText,
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height / 1.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              ApiConstants.imagePath + entity.posterPath),
                          fit: BoxFit.cover)),
                ),
                PositiondWidget(
                  txt: entity.voteAverage.toStringAsFixed(1),
                  top: 40,
                  right: 10,
                  icons: Icons.star,
                ),
                PositiondWidget(
                    txt: entity.voteCount.toString(),
                    top: 120,
                    right: 10,
                    icons: Icons.remove_red_eye),
                // Positioned(
                //     bottom: 50,
                //     left: 10,
                //     child: Text(
                //       entity.originalTitle,
                //       style: GoogleFonts.mohave(
                //         fontSize: 30,
                //         fontWeight: FontWeight.w700,
                //         color: theme.colors.movieName,
                //       ),
                //     )
                //     ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 300,
                      decoration: const BoxDecoration(
                        // borderRadius:
                        //     BorderRadius.vertical(top: Radius.circular(20))
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.black, Colors.transparent]),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              entity.originalTitle,
                              style: GoogleFonts.mohave(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: theme.colors.movieName,
                              ),
                            ),
                            Text(
                              'Action,Drama',
                              style: GoogleFonts.mohave(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: theme.spaces.space_100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WatchButtonWidget(
                  icon: Icons.play_circle_outline_outlined,
                  txt: HomeConstants.watchText,
                  function: () {},
                ),
                WatchButtonWidget(
                  icon: Icons.add_circle_outline,
                  txt: HomeConstants.watchList,
                  function: () {},
                ),
                WatchButtonWidget(
                  icon: Icons.share,
                  txt: HomeConstants.shareTxt,
                  function: () {},
                ),
              ],
            ),
            SizedBox(
              height: theme.spaces.space_150,
            ),
            Text(
              entity.overview,
              textAlign: TextAlign.start,
              style: GoogleFonts.mohave(fontSize: 18),
            ),
            SizedBox(
              height: 30,
            ),

            // Container(
            //   width: MediaQuery.sizeOf(context).width / 1.1,
            //   height: 200,
            //   decoration: BoxDecoration(
            //       color: Colors.grey[200],
            //       borderRadius: BorderRadius.circular(10)),
            //   child: ,
            // )
          ],
        ),
      ),
    );
  }
}
