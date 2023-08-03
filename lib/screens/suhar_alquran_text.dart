import 'dart:convert';

import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../api/api.dart';
import '../utils/constant.dart';

class SuharAlQuranText extends StatefulWidget {
  const SuharAlQuranText(
      {super.key, required this.surahNumber, required this.surahName});
  final int surahNumber;
  final String surahName;

  @override
  State<SuharAlQuranText> createState() => _SuharAlQuranTextState();
}

class _SuharAlQuranTextState extends State<SuharAlQuranText> {
  late Future<List<dynamic>?> fetchedSurah;

  @override
  void initState() {
    fetchedSurah = Api().getSurah(widget.surahNumber);
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
            widget.surahName,
            style: GoogleFonts.amiri(fontSize: 25),
          ),
        ),
        body: FutureBuilder<List<dynamic>?>(
          // future: _fetchImage(),
          future: fetchedSurah,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.hasData) {
              return snapshot.data == ''
                  ? const Text('no data')
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: AutoSizeText(
                                        '${snapshot.data[index]['ar']} '
                                        "\uFD3F"
                                        '${ArabicNumbers().convert(snapshot.data[index]['nomor'])}'
                                        "\uFD3E"
                                        " ",
                                        softWrap: true,
                                        style: const TextStyle(
                                          fontFamily: 'Kitab',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 22,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.share_outlined,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(),
                      itemCount: snapshot.data.length,
                    );
              // ListView.builder(itemBuilder: (context, index) {
              //     //  getSurah();
              //     return
              //     Row(
              //       children: [
              //         for (int i = 0; i < ayahsNumber!; i++) ...[
              //           Text(
              //             '${snapshot.data[i]['text']['arab']}',
              //             style: const TextStyle(
              //               color: Colors.white,
              //               fontFamily: 'Quran',
              //               fontSize: 25,
              //             ),
              //           ),
              //           Text(
              //             " "
              //             "\uFD3F"
              //             '${ArabicNumbers().convert(snapshot.data[i]['number']['inSurah'])}'
              //             "\uFD3E"
              //             " ",
              //             style: const TextStyle(
              //                 color: Colors.white, fontSize: 18),
              //           ),
              //         ]
              //       ],
              //     );
              //   });
              // ListView.separated(
              //     itemBuilder: (context, index) => Wrap(
              //           children: [
              //             for (int i = 0; i < 7; i++)
              //               Text(
              //                 snapshot.data[i]['text'],
              //                 style: const TextStyle(color: Colors.white),
              //               )
              //           ],
              //         ),
              //     separatorBuilder: (context, index) => const SizedBox(),
              //     itemCount: quranSurahs.length);
            }
            return const Text(
              'no data yet',
              style: TextStyle(color: Colors.white),
            );
          },
        ),
      ),
    );
  }
}
