import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_with_clean/core/constants/home_constants.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';

class FavouritePage extends StatelessWidget {
  static const routePath = '/favourite';
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        iconTheme: IconThemeData(color: theme.colors.text),
        backgroundColor: theme.colors.primary,
        title: Text(
          HomeConstants.favorTxt,
          style: GoogleFonts.mohave(
              color: theme.colors.text,
              fontWeight: FontWeight.w600,
              fontSize: 22),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: theme.colors.fieldText,
            ),
            width: MediaQuery.sizeOf(context).width,
            height: 150,
            child: Row(
              children: [
                Container(
                  width: 150,
                  height: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amber),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
