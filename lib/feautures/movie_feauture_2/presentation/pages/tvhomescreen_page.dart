// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:movie_app_with_clean/core/constants/movieapi/api_constants.dart';
// import 'package:movie_app_with_clean/core/theme/app_theme.dart';
// import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
// import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/providers/movie_provider.dart';
// import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/widgets/bottomnavigation_widget.dart';

// class TvHomePage extends ConsumerWidget {
//   static const routePath = '/tvhome';
//   final image = ApiConstants.imagePath;
//   final List<MovieEntity> data;
//   const TvHomePage({super.key, required this.data});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final theme = AppTheme.of(context);
//     return Scaffold(
//         bottomNavigationBar: BottomWidget(),
//         body: ref.watch(movieApiProvider).isRefreshing
//             ? Center(
//                 child: CircularProgressIndicator(),
//               )
//             : switch (ref.watch(movieApiProvider)) {
//                 AsyncData(:final value) => ListView.builder(
//                     itemBuilder: (context, index) {
//                       return Column(
//                         children: [
//                           CarouselSlider.builder(
//                               itemCount: data.length,
//                               itemBuilder: (context, index, realIndex) =>
//                                   Container(
//                                     decoration: BoxDecoration(
//                                         image: DecorationImage(
//                                             image: NetworkImage(
//                                                 image + data[index].posterPath),
//                                             fit: BoxFit.fill),
//                                         borderRadius: BorderRadius.circular(20),
//                                         color: theme.colors.primary),
//                                   ),
//                               options: CarouselOptions(
//                                 height: 350,
//                                 aspectRatio: 16 / 9,
//                                 viewportFraction: 0.9,
//                                 initialPage: 0,
//                                 autoPlay: true,
//                                 autoPlayInterval: Duration(seconds: 4),
//                                 autoPlayAnimationDuration:
//                                     Duration(milliseconds: 2500),
//                                 autoPlayCurve: Curves.fastOutSlowIn,
//                                 enlargeCenterPage: true,
//                                 enlargeFactor: 0.3,
//                                 // onPageChanged: callbackFunction,
//                                 scrollDirection: Axis.horizontal,
//                               ))
//                         ],
//                       );
//                     },
//                   ),
//                 AsyncError(:final error) => Center(
//                     child: TextButton(
//                       onPressed: () {
//                         ref.invalidate(movieApiProvider);

//                         print(error);
//                       },
//                       child: const Text('Retry'),
//                     ),
//                   ),
//                 _ => const Center(
//                     child: CircularProgressIndicator(),
//                   )
//               });
//   }
// }
