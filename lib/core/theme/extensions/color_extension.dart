import 'package:flutter/material.dart';

class AppColorExtension extends ThemeExtension<AppColorExtension> {
  final Color primary;
  final Color secondary;
  final Color text;
  final Color textInverse;
  final Color textSubtle;
  final Color textSubtlest;
  final Color backgroundDanger;
  final Color fieldText;
  final Color movieName;

  AppColorExtension(
      {required this.primary,
      required this.secondary,
      required this.text,
      required this.textInverse,
      required this.textSubtle,
      required this.textSubtlest,
      required this.backgroundDanger,
      required this.movieName,
      required this.fieldText});

  @override
  ThemeExtension<AppColorExtension> copyWith(
      {Color? primary,
      Color? secondary,
      Color? text,
      Color? textInverse,
      Color? textSubtle,
      Color? textSubtlest,
      Color? backgroundDanger,
      Color? movieName,
      Color? fieldText}) {
    return AppColorExtension(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      text: text ?? this.text,
      textInverse: textInverse ?? this.textInverse,
      textSubtle: textSubtle ?? this.textSubtle,
      textSubtlest: textSubtlest ?? this.textSubtlest,
      backgroundDanger: backgroundDanger ?? this.backgroundDanger,
      movieName: movieName ?? this.movieName,
      fieldText: fieldText ?? this.fieldText,
    );
  }

  @override
  ThemeExtension<AppColorExtension> lerp(
      covariant ThemeExtension<AppColorExtension>? other, double t) {
    if (other is! AppColorExtension) {
      return this;
    }

    return AppColorExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      text: Color.lerp(text, other.text, t)!,
      textInverse: Color.lerp(textInverse, other.textInverse, t)!,
      textSubtle: Color.lerp(textSubtle, other.textSubtle, t)!,
      textSubtlest: Color.lerp(textSubtlest, other.textSubtlest, t)!,
      backgroundDanger:
          Color.lerp(backgroundDanger, other.backgroundDanger, t)!,
      fieldText: Color.lerp(fieldText, other.fieldText, t)!,
      movieName: Color.lerp(movieName, other.movieName, t)!,
    );
  }
}
