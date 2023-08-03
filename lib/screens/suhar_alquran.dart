import 'dart:convert';
import 'package:ayat_app/screens/search-delegate.dart';
import 'package:ayat_app/screens/suhar_alquran_text.dart';
import 'package:ayat_app/screens/surah_page_view.dart';
import 'package:ayat_app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../api/api.dart';
import '../widgets/surah_item.dart';

class SuharAlQuranImage extends StatefulWidget {
  const SuharAlQuranImage({super.key});

  @override
  State<SuharAlQuranImage> createState() => _SuharAlQuranImageState();
}

class _SuharAlQuranImageState extends State<SuharAlQuranImage> {
  late List<dynamic>? fetchedSurah;
  getItems() async {
    fetchedSurah = await Api().getSurah(3);
  }

  @override
  void initState() {
    getItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: kPrimaryColor,
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: kPrimaryColor,
              title: Text(
                'القرآن الكريم',
                style: GoogleFonts.amiri(fontSize: 25),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(items: fetchedSurah!),
                    );
                  },
                  icon: const Icon(Icons.search),
                ),
              ]),
          body: ListView.separated(
            itemBuilder: (context, index) => SurahItem(
                number: quranSurahs[index].surahNumber,
                name: quranSurahs[index].arabicName,
                numberSurah: quranSurahs[index].numberOfVerses,
                type: quranSurahs[index].revelationType,
                onTap: () {
                  print(quranSurahs[index].surahNumber);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => SuharAlQuranText(
                  //       surahNumber: quranSurahs[index].surahNumber,
                  //       surahName: quranSurahs[index].arabicName,
                  //     ),
                  //   ),
                  // );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return SurahPageView(
                        imageNumber: pageNumbers[index],
                      );
                    }),
                  );
                }
                // => Navigator.push(context,
                //     MaterialPageRoute(builder: (context) {
                //   return AyatAlSuhar(
                //     surahName: snapshot.data[index]['name']['short'],
                //     number: snapshot.data[index]['number'],
                //     numberOfAyat: snapshot.data[index]['numberOfVerses'],
                //   );
                // },),),
                ),
            separatorBuilder: (context, index) => const SizedBox(),
            itemCount: quranSurahs.length,
          )

          // FutureBuilder<List<dynamic>?>(
          //   // future: _fetchImage(),
          //  future: fetchedSurah,
          //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return const Center(child: CircularProgressIndicator());
          //     }
          //     if (snapshot.hasError) {
          //       return Text(snapshot.error.toString());
          //     }
          //     if (snapshot.hasData) {
          //       return snapshot.data == ''
          //           ? const Text('no data')
          //           : ListView.separated(
          //               itemBuilder: (context, index) => surahItem(
          //                     number: 1,
          //                     name: quranSurahs[index].arabicName,
          //                     numberSurah: quranSurahs[index].numberOfVerses,
          //                     type: quranSurahs[index].revelationType,
          //                     onTap: () => Navigator.push(context,
          //                         MaterialPageRoute(builder: (context) {
          //                       return AyatAlSuhar(
          //                         surahName: snapshot.data[index]['name']
          //                             ['short'],
          //                         number: snapshot.data[index]['number'],
          //                         numberOfAyat: snapshot.data[index]
          //                             ['numberOfVerses'],
          //                       );
          //                     })),
          //                   ),
          //               separatorBuilder: (context, index) => const SizedBox(),
          //               itemCount: quranSurahs.length);
          //     }
          //     return const Text(
          //       'no data yet',
          //       style: TextStyle(color: Colors.white),
          //     );
          //   },
          // ),
          ),
    );
  }
}
