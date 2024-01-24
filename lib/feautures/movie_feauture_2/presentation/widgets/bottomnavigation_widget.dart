import 'package:flutter/material.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.80)),
      child: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: AppTheme.of(context).colors.secondary,
        unselectedItemColor: AppTheme.of(context).colors.primary,
        backgroundColor: Color(0xff435661).withOpacity(0.1),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.movie_filter_outlined,
              ),
              label: 'Movies'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.tv,
              ),
              label: 'TV shows'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
              ),
              label: 'Favorite'),
          BottomNavigationBarItem(
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
