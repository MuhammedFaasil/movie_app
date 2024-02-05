import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_clean/core/constants/home_constants.dart';
import 'package:movie_app_with_clean/core/constants/movieapi/api_constants.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/review_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/providers/movie_provider.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/providers/trailer_provider.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/widgets/positiond_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/widgets/review_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/widgets/search_field_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class OverViewPage extends HookConsumerWidget {
  static const routePath = '/overview';
  final MovieEntity entity;

  const OverViewPage({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentController = useTextEditingController();
    final theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.fieldText,
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Builder(builder: (context) {
                  final posterPathFile = File(entity.posterPath);
                  late final ImageProvider image;
                  if (posterPathFile.existsSync()) {
                    image = FileImage(posterPathFile);
                  } else {
                    image = NetworkImage(
                        ApiConstants.imagePath + entity.posterPath);
                  }
                  return Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height / 1.5,
                    decoration: BoxDecoration(
                        image:
                            DecorationImage(image: image, fit: BoxFit.cover)),
                  );
                }),
                Positioned(
                    top: 40,
                    left: 10,
                    child: IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: theme.colors.primary,
                        ))),
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
                Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 300,
                      decoration: const BoxDecoration(
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
                            ),
                          ],
                        ),
                      ),
                    )),
                Positioned(
                    right: 10,
                    bottom: 15,
                    child: IconButton(
                        onPressed: () {
                          ref
                              .read(movieApiProvider.notifier)
                              .addToFIrestore(entity);
                          // context.push(FavouritePage.routePath);
                        },
                        icon: Icon(
                          Icons.favorite_border,
                          color: theme.colors.primary,
                        )))
              ],
            ),
            SizedBox(
              height: theme.spaces.space_100,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     WatchButtonWidget(
            //       icon: Icons.play_circle_outline_outlined,
            //       txt: HomeConstants.watchText,
            //       function: () {
            //         context.push(TrailerWidget.routePath);
            //       },
            //     ),
            //     WatchButtonWidget(
            //       icon: Icons.add_circle_outline,
            //       txt: HomeConstants.watchList,
            //       function: () {},
            //     ),
            //     WatchButtonWidget(
            //       icon: Icons.share,
            //       txt: HomeConstants.shareTxt,
            //       function: () {},
            //     ),
            //   ],
            // ),
            SizedBox(
              height: theme.spaces.space_150,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 1.1,
              child: Text(
                entity.overview,
                textAlign: TextAlign.justify,
                style: GoogleFonts.mohave(fontSize: 18),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: theme.spaces.space_400,
            ),
            ref.watch(trailerProvider(entity.id.toString())).isRefreshing
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(
                    child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * .24,
                    child: Center(
                      child: switch (
                          ref.watch(trailerProvider(entity.id.toString()))) {
                        AsyncData(:final value) => PageView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: value.length,
                            itemBuilder: (context, index) {
                              // return Center(
                              //   child: Text(value[index].name),
                              // );
                              return YoutubePlayer(
                                controller: YoutubePlayerController(
                                  initialVideoId: value[index].key,
                                  flags: const YoutubePlayerFlags(
                                    autoPlay: false,
                                    mute: false,
                                    disableDragSeek: true,
                                  ),
                                ),
                                bufferIndicator: const Center(
                                    child: CircularProgressIndicator()),
                                showVideoProgressIndicator: true,
                              );
                            },
                          ),
                        AsyncError(:final error) => Column(
                            children: [
                              Text("$error"),
                              TextButton(
                                onPressed: () {
                                  ref.invalidate(
                                      trailerProvider(entity.id.toString()));
                                },
                                child: const Text('Retry'),
                              )
                            ],
                          ),
                        _ => const CircularProgressIndicator()
                      },
                    ),
                  )),
            const SizedBox(
              height: 20,
            ),
            SearchFieldWidget(
                controller: commentController,
                txt: HomeConstants.reviewTxt,
                icons: IconButton(
                    onPressed: () {
                      ref.read(movieApiProvider.notifier).addReview(
                          ReviewEntity(
                              review: commentController.text,
                              id: entity.id.toString(),
                              movieId: entity.id.toString()),
                          entity.id.toString());
                      commentController.clear();
                    },
                    icon: const Icon(Icons.send))),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  HomeConstants.comntTxt,
                  style: GoogleFonts.mohave(
                      fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 300,
              child: StreamBuilder(
                stream: ref
                    .read(movieApiProvider.notifier)
                    .getReview(entity.id.toString()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ReviewWidget(
                      value: snapshot.data!,
                      itemCount: snapshot.data!.length,
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
