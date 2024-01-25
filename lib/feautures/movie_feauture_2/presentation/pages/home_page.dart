import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_with_clean/core/constants/home_constants.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/authentication/sighup_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/providers/auth_provider.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/providers/movie_provider.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/widgets/bottomnavigation_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/widgets/carosel_slider_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/widgets/drawer_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/widgets/grid_view_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/widgets/listview_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/widgets/search_field_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/widgets/thirdapi_widget.dart';

class HomePage extends ConsumerWidget {
  static const routerPath = '/';
  const HomePage({super.key});

  get loading => null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return Scaffold(
      drawer: DrawerWidget(),
      extendBody: true,
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomWidget(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: theme.colors.secondary),
        // leading: IconButton(
        //   icon: Icon(Icons.menu, color: theme.colors.text),
        //   onPressed: () {},
        // ),
        elevation: 0.2,
        centerTitle: true,
        backgroundColor: theme.colors.primary,
        title: Text(
          HomeConstants.appName,
          style: GoogleFonts.mohave(color: theme.colors.text),
        ),
      ),
      body:
          // ref.watch(movieApiProvider).isRefreshing
          //     ? const Center(
          //         child: CircularProgressIndicator(),
          //       )
          //     : ref.watch(movieApiProvider).when(
          //           data: (value) => ListView.builder(
          //             itemCount: 1,
          //             itemBuilder: (context, index) {
          //               return SafeArea(
          //                 child: SingleChildScrollView(
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       const SearchFieldWidget(),
          //                       SizedBox(
          //                         height: theme.spaces.space_150,
          //                       ),
          //                       // GenereListWidget(),

          //                       Padding(
          //                         padding: const EdgeInsets.only(left: 10),
          //                         child: Text(
          //                           HomeConstants.trendText,
          //                           style: GoogleFonts.mohave(
          //                               fontWeight: FontWeight.w600,
          //                               fontSize: 18),
          //                         ),
          //                       ),
          //                       SizedBox(
          //                         height: theme.spaces.space_500,
          //                       ),
          //                       CaroselWidget(
          //                         data: value.movies,
          //                       ),
          //                       SizedBox(
          //                         height: theme.spaces.space_500,
          //                       ),
          //                       Padding(
          //                         padding: const EdgeInsets.only(left: 10),
          //                         child: Text(
          //                           HomeConstants.topRated,
          //                           style: theme.typography.h500,
          //                         ),
          //                       ),
          //                       SizedBox(
          //                         height: theme.spaces.space_100,
          //                       ),
          //                       SizedBox(
          //                         height: 300,
          //                         child: GridViewWidget(
          //                           data: value.nowPlaying,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               );
          //             },
          //           ),
          //           error: (error, stackTrace) => Center(
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Text(error.toString()),
          //                 IconButton(
          //                   onPressed: () {
          //                     ref.invalidate(movieApiProvider);
          //                   },
          //                   icon: const Icon(Icons.refresh),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           loading: () => const Center(
          //             child: CircularProgressIndicator(),
          //           ),
          //         )
          ref.watch(movieApiProvider).isRefreshing
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : switch (ref.watch(movieApiProvider)) {
                  AsyncData(:final value) => ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return SafeArea(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SearchFieldWidget(),
                                SizedBox(
                                  height: theme.spaces.space_150,
                                ),
                                GenereListWidget(data: value.actionMovies),
                                SizedBox(
                                  height: theme.spaces.space_400,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    HomeConstants.trendText,
                                    style: GoogleFonts.mohave(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                ),
                                SizedBox(
                                  height: theme.spaces.space_500,
                                ),
                                CaroselWidget(
                                  data: value.movies,
                                ),
                                SizedBox(
                                  height: theme.spaces.space_500,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    HomeConstants.topRated,
                                    style: theme.typography.h500,
                                  ),
                                ),
                                SizedBox(
                                  height: theme.spaces.space_100,
                                ),
                                SizedBox(
                                  height: 350,
                                  child: GridViewWidget(
                                    data: value.nowPlaying,
                                  ),
                                ),
                                SizedBox(
                                  height: theme.spaces.space_500,
                                ),
                                ListViewWidget(data: value.nowPlaying)
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  AsyncError() => Center(
                      child: TextButton(
                        onPressed: () {
                          ref.invalidate(movieApiProvider);
                          print("object");
                        },
                        child: const Text('Retry'),
                      ),
                    ),
                  _ => const Center(
                      child: CircularProgressIndicator(),
                    )
                },
    );
  }
}
