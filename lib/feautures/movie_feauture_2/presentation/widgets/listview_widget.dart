import 'package:flutter/material.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';

class GenereListWidget extends StatelessWidget {
  List<String> text = ['Action', 'drama', 'Comedy', 'Crime', 'Romance'];
  GenereListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => Container(
          width: 80,
          height: 100,
          child: Center(child: Text(text[index])),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: theme.colors.fieldText),
        ),
      ),
    );
  }
}
