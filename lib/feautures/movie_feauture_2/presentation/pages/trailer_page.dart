import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/providers/trailer_provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerWidget extends ConsumerWidget {
  static const routePath ='/video';
  final MovieEntity movie;
  const TrailerWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Trailer Page'),
        ),
        body: ref.watch(trailerProvider(movie.id.toString())).isRefreshing
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: SizedBox(
                height: MediaQuery.sizeOf(context).height * .24,
                child: Center(
                  child: switch (
                      ref.watch(trailerProvider(movie.id.toString()))) {
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
                                  trailerProvider(movie.id.toString()));
                            },
                            child: const Text('Retry'),
                          )
                        ],
                      ),
                    _ => const CircularProgressIndicator()
                  },
                ),
              ))
              );
  }
}
