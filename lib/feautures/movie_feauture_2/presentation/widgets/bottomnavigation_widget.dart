import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/pages/favourite_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/pages/home_page.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // int selectedIndex = 0;
    return Container(
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.80)),
      child: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: AppTheme.of(context).colors.secondary,
        unselectedItemColor: AppTheme.of(context).colors.primary,
        backgroundColor: const Color(0xff435661).withOpacity(0.1),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    context.push(HomePage.routerPath);
                  },
                  icon: const Icon(Icons.movie)),
              label: 'Movies'),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.tv,
              ),
              label: 'TV shows'),
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    context.push(FavouritePage.routePath);
                  },
                  icon: const Icon(Icons.favorite_border)),
              label: 'Favorite'),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Profile'),
          // BottomNavigationBarItem(
          //     icon: Icon(
          //       Icons.location_city,
          //     ),
          //     label: ''),
          // BottomNavigationBarItem(
          //     icon: Icon(
          //       Icons.person,
          //     ),
          //     label: ''),
        ],
      ),
    );
  }
}
