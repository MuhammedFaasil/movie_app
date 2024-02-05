import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WatchButtonWidget extends StatelessWidget {
  final String txt;
  final IconData icon;
  final void Function() function;
  const WatchButtonWidget(
      {super.key,
      required this.icon,
      required this.txt,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: function,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              txt,
              style: GoogleFonts.mohave(
                color: Colors.black,
              ),
            ),
          ],
        ));
  }
}
