import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextZekr extends StatelessWidget {
  const TextZekr(
      {super.key,
      required this.zekr,
      required this.count,
      required this.onTap,
      required this.color,
      required this.description,
      required this.reference,
      required this.bookmark});
  final String zekr;
  final int count;
  final Function() onTap;
  final Color color;
  final String description;
  final String reference;
  final Function() bookmark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          AutoSizeText(
            textDirection: TextDirection.rtl,
            zekr,
            style: GoogleFonts.tajawal(
              fontSize: 22,
              height: 1.8,
              letterSpacing: .2,
              wordSpacing: 0.5,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(flex: 1),
          Text(
            reference,
            style: GoogleFonts.tajawal(
                fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          const Spacer(
            flex: 6,
          ),
          Text(
            textDirection: TextDirection.rtl,
            description,
            style: GoogleFonts.tajawal(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const Spacer(
            flex: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: TextDirection.rtl,
            children: [
              FloatingActionButton(
                // shape: const CircleBorder(),
                backgroundColor: color,
                onPressed: onTap,
                child: Text(
                  '$count',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // FloatingActionButton(
              //   onPressed: bookmark,
              //   shape: const CircleBorder(),
              //   backgroundColor: blue,
              //   child: const Icon(
              //     Icons.bookmark_outline,
              //     color: Colors.white,
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
/*

Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(16),
    //  width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0x1e4981f0),
      ),
      child: Column(children: [
        AutoSizeText(
          textDirection: TextDirection.rtl,
          zekr,
          style: GoogleFonts.tajawal(
            fontSize: 22,
            height: 1.8,
            letterSpacing: .2,
            wordSpacing: 0.5,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: blue,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(24),
                bottomLeft: Radius.circular(24),
              ),
            ),
            child: Text(
              '$count',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ]),
    );

 */