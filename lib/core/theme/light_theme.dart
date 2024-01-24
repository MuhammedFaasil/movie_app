import 'package:flutter/material.dart';
import 'package:movie_app_with_clean/core/theme/color_pallet.dart';
import 'package:movie_app_with_clean/core/theme/extensions/color_extension.dart';
import 'package:movie_app_with_clean/core/theme/extensions/space_extension.dart';
import 'package:movie_app_with_clean/core/theme/extensions/typography_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'light_theme.g.dart';

final _lightTheme = ThemeData(
  brightness: Brightness.light,
  extensions: [
    AppColorExtension(
      primary: Colors.white,
      secondary: Colors.black,
      text: AppColorPalette.grey900,
      textInverse: Colors.white,
      textSubtle: AppColorPalette.grey700,
      textSubtlest: AppColorPalette.grey500,
      backgroundDanger: Colors.red,
      movieName :AppColorPalette.yellow100,
      fieldText: AppColorPalette.grey200,
    ),
    AppSpaceExtension.fromBaseSpace(8),
    AppTypographyExtension.fromColors(
      defaultFontColor: AppColorPalette.grey900,
      linkColor: Colors.blue,
      dimFontColor: AppColorPalette.grey700,
    )
  ],
);

@riverpod
ThemeData lightTheme(LightThemeRef ref) {
  return _lightTheme;
}
