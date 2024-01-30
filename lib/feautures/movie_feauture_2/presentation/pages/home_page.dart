import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_with_clean/core/constants/home_constants.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/providers/movie_provider.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/widgets/bottomnavigation_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/widgets/carosel_slider_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/widgets/drawer_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/widgets/grid_view_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/widgets/listview_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/widgets/search_field_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/widgets/seemore_button_widget.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/widgets/thirdapi_widget.dart';

class HomePage extends ConsumerWidget {
  static const routerPath = '/';
  const HomePage({super.key});
  // get loading => null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return Scaffold(
      drawer: const DrawerWidget(),
      extendBody: true,
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomWidget(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: theme.colors.secondary),
        elevation: 0.2,
        centerTitle: true,
        backgroundColor: theme.colors.primary,
        title: Text(
          HomeConstants.appName,
          style: GoogleFonts.mohave(color: theme.colors.text),
        ),
      ),
      body: ref.watch(movieApiProvider).isRefreshing
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
                            GenereListWidget(data: value.genre),
                            SizedBox(
                              height: theme.spaces.space_400,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                HomeConstants.trendText,
                                style: GoogleFonts.mohave(
                                    fontWeight: FontWeight.w600, fontSize: 22),
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    HomeConstants.topRated,
                                    style: GoogleFonts.mohave(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22),
                                  ),
                                  SeemoreWidget(function: () {})
                                ],
                              ),
                            ),
                            SizedBox(
                              height: theme.spaces.space_100,
                            ),
                            SizedBox(
                              height: 380,
                              child: GridViewWidget(
                                data: value.popular,
                              ),
                            ),
                            SizedBox(
                              height: theme.spaces.space_400,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    HomeConstants.popularText,
                                    style: GoogleFonts.mohave(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22),
                                  ),
                                  SeemoreWidget(function: () {})
                                ],
                              ),
                            ),
                            SizedBox(
                              height: theme.spaces.space_100,
                            ),
                            ListViewWidget(data: value.nowPlaying),
                            SizedBox(
                              height: theme.spaces.space_200,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              AsyncError(:final error) => Center(
                  child: TextButton(
                    onPressed: () {
                      ref.invalidate(movieApiProvider);

                      print(error);
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
