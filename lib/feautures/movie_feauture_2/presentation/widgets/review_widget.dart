import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_with_clean/core/theme/app_theme.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/review_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/providers/movie_provider.dart';

class ReviewWidget extends ConsumerWidget {
  final List<ReviewEntity> value;
  // final void Function() function;
  final int itemCount;
  const ReviewWidget({
    super.key,
    required this.value,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        thickness: 0.2,
        color: theme.colors.secondary,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            // side: const BorderSide(color: Colors.black, width: 0.3)
          ),
          leading: const Icon(Icons.person),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                FirebaseAuth.instance.currentUser!.displayName.toString(),
                style: GoogleFonts.mohave(
                  fontSize: 14,
                ),
              ),
              Text(
                value[index].review,
                style: GoogleFonts.mohave(fontSize: 17),
              ),
            ],
          ),
          trailing: IconButton(
              onPressed: () {
                ref
                    .read(movieApiProvider.notifier)
                    .deletReview(value[index].id);
              },
              icon: const Icon(Icons.remove)),
        );
      },
    );
  }
}
