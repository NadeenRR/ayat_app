import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCategoryZker extends StatelessWidget {
  const MyCategoryZker({
    super.key,
    required this.onTap,
    required this.text,
  });

  final Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0x1e4981f0),
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            text,
            style: GoogleFonts.tajawal(
              textStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
