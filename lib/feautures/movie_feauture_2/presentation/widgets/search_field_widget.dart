import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_with_clean/core/constants/home_constants.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none),
            fillColor: theme.colors.fieldText,
            filled: true,
            labelText: HomeConstants.fieldText,
            labelStyle: TextStyle(
                fontWeight: FontWeight.bold, color: theme.colors.secondary),
            suffixIcon:
                Icon(CupertinoIcons.search, color: theme.colors.secondary)),
      ),
    );
  }
}
