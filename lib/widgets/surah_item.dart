import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SurahItem extends StatelessWidget {
  const SurahItem({
    super.key,
    required this.number,
    required this.name,
    required this.numberSurah,
    required this.type,
    required this.onTap,
  });

  final int number;
  final String name;
  final int numberSurah;
  final String type;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(children: [
          Stack(
            children: [
              Image.asset('assets/images/surah-icon.png'),
              SizedBox(
                height: 36,
                width: 36,
                child: Center(
                  child: Text(
                    ArabicNumbers().convert(number),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.amiri(fontSize: 25, color: Colors.white),
              ),
              Text(
                'عدد آياتها: ${ArabicNumbers().convert(numberSurah)}',
                style: GoogleFonts.amiri(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
          const Spacer(),
          Text(
            type == 'Makki' ? 'مكية' : 'مدنية',
            style: GoogleFonts.amiri(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
        ]),
      ),
    );
  }
}
