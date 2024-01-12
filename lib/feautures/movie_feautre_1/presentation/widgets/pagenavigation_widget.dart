import 'package:flutter/material.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';

class SighnInOrUpWidget extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  const SighnInOrUpWidget(
      {super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label,
          style: TextStyle(color: AppTheme.of(context).colors.secondary)),
    );
  }
}
