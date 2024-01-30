import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';

class SeemoreWidget extends StatelessWidget {
  final void Function() function;
  const SeemoreWidget({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          function;
        },
        child: Text(
          'See More',
          style:
              GoogleFonts.mohave(color: AppTheme.of(context).colors.textSubtle),
        ));
  }
}
