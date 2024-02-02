import 'package:flutter/material.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';

class SearchFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final IconButton icons;
  final String txt;
  const SearchFieldWidget({super.key, required this.icons, required this.txt,required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: theme.colors.secondary)),
            fillColor: theme.colors.fieldText,
            filled: true,
            labelText: txt,
            labelStyle: TextStyle(
                fontWeight: FontWeight.bold, color: theme.colors.secondary),
            suffixIcon: icons),
      ),
    );
  }
}
