import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCategory extends StatelessWidget {
  const CustomCategory(
      {super.key,
      required this.image,
      required this.title,
      required this.onTap});
  final String image;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0x1e4981f0),
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              width: 70,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: GoogleFonts.tajawal(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
