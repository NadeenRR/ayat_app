import 'dart:convert';

import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ayat_app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class AyatAlSuhar extends StatefulWidget {
  const AyatAlSuhar(
      {super.key,
      required this.surahName,
      required this.number,
      required this.numberOfAyat});
  final String surahName;
  final int number;
  final int numberOfAyat;

  @override
  State<AyatAlSuhar> createState() => _AyatAlSuharState();
}

class _AyatAlSuharState extends State<AyatAlSuhar> {
  late Future<List<dynamic>?> fetchedAyah;
  List fetchedAyah1 = [];

  Future<List<dynamic>?> getAyah() async {
    final myFuture = await http.get(
      Uri.parse(
        'https://api.quran.gading.dev/surah/${widget.number}',
      ),
    );
    if (myFuture.statusCode == 200) {
      return jsonDecode(myFuture.body)['data']['verses'];
    }
    return Future.error('Something Went Wrong');
  }

  @override
  void initState() {
    fetchedAyah = getAyah();

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
          future: fetchedAyah,
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
                  : PageView.builder(
                      itemCount: widget.numberOfAyat,
                      itemBuilder: (context, index) {
                        List<TextSpan> ayahsByPage = [];
                        bool isBasmalahShown = false;

                        if (snapshot.data[index]['number']['inSurah'] == 1 &&
                            widget.number != 1 &&
                            widget.number != 9) {
                          isBasmalahShown = true;
                        }

                        ayahsByPage.addAll(
                          [
                            if (isBasmalahShown) ...[
                              const TextSpan(
                                text: "\n\n‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏\n\n",
                                style: TextStyle(
                                  fontFamily: 'Hafs',
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  height: 2,
                                  backgroundColor: Colors.black12,
                                ),
                              )
                            ],
                            TextSpan(
                              text: snapshot.data[index]['text']['arab'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Quran',
                                fontSize: 20,
                              ),
                            ),
                            TextSpan(
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                              text: " "
                                  "\uFD3F"
                                  '${ArabicNumbers().convert(snapshot.data[index]['number']['inSurah'])}'
                                  "\uFD3E"
                                  " ",
                            )
                          ],
                        );
                        isBasmalahShown = false;

                        return SafeArea(
                          child: Container(
                            decoration: index % 2 == 0
                                ? const BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                        Color(0x27000000),
                                        Colors.transparent,
                                        Colors.transparent,
                                        Colors.transparent,
                                        Colors.transparent
                                      ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight))
                                : const BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0x27000000),
                                          Colors.transparent,
                                          Colors.transparent,
                                          Colors.transparent,
                                          Colors.transparent
                                        ],
                                        begin: Alignment.centerRight,
                                        end: Alignment.centerLeft),
                                  ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              child: SingleChildScrollView(
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxHeight:
                                          MediaQuery.of(context).size.height -
                                              Scaffold.of(context)
                                                  .appBarMaxHeight! -
                                              30),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'الجزء  ${ArabicNumbers().convert(snapshot.data[index]['meta']['juz'])}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 20),
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                        ),
                                      ),
                                      Container(
                                        constraints: const BoxConstraints(
                                            maxHeight: 500),
                                        child: AutoSizeText.rich(
                                          maxLines: 15,
                                          minFontSize: 16,
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          TextSpan(
                                              style:
                                                  DefaultTextStyle.of(context)
                                                      .style,
                                              children: ayahsByPage),
                                        ),
                                      ),
                                      Text(
                                        '${ArabicNumbers().convert(snapshot.data[index]['number']['inQuran'])}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      });
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
