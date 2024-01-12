import 'package:flutter/material.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final Icon icons;
  final TextEditingController controller;
  const TextFieldWidget({super.key, required this.labelText,required this.icons,required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 1.1,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: icons,
            labelStyle: TextStyle(color: AppTheme.of(context).colors.text),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppTheme.of(context).colors.secondary, width: 2))),
      ),
    );
  }
}
