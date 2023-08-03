import 'package:ayat_app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_banner.dart';
import '../widgets/custom_box.dart';
import '../widgets/custom_category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: Text(
            'آيــات',
            style: GoogleFonts.amiri(
                fontWeight: FontWeight.bold, fontSize: 28, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 12, vertical: 16),
            child: Column(
              children: [
                const CustomBanner(),
                const SizedBox(
                  height: 18,
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics:  BouncingScrollPhysics(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBox(),
                      CustomBox(),
                      CustomBox(),
                      CustomBox(),
                      CustomBox(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomCategory(
                      image: 'assets/images/quran.png',
                      title: 'القرآن الكريم',
                      onTap: () =>
                          Navigator.pushReplacementNamed(context, '/suhar'),
                    )),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: CustomCategory(
                      image: 'assets/images/doaa.png',
                      title: 'أذكاري',
                      onTap: () => Navigator.pushNamed(context, '/azkar'),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomCategory(
                      image: 'assets/images/kaaba.png',
                      title: 'اتجاه القبلة',
                      onTap: () => Navigator.pushNamed(context, '/qiblah'),
                    )),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: CustomCategory(
                      image: 'assets/images/tasbih.png',
                      title: 'المسبحة',
                      onTap: () {},
                    )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
