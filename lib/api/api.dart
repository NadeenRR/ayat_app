import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Api {

  Future<dynamic> getTafseer(
      {required String surahNum, required String ayahNum}) async {
    String url = 'http://api.quran-tafseer.com/tafseer/1/$surahNum/$ayahNum';

    http.Response response = await http.get(Uri.parse(url), headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.varyHeader: 'Origin, Accept-Language, Cookie'
    });

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      return null;
    }
  }

  Future<dynamic> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);

    return data;
  }

  Future<List<dynamic>?> getSurah(int surahNumber) async {
    final myFuture = await http.get(
      Uri.parse(
        'https://equran.id/api/surat/$surahNumber',
      ),
    );

    if (myFuture.statusCode == 200) {
      return jsonDecode(myFuture.body)['ayat'];
    }
    return Future.error('Something Went Wrong');
  }
}
