import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constant.dart';
import '../widgets/text_zker.dart';

class Almasaa extends StatefulWidget {
  const Almasaa({super.key});

  @override
  State<Almasaa> createState() => _AlmasaaState();
}

class _AlmasaaState extends State<Almasaa> {
  Future<dynamic>? fetchedAzkar;

  Future<dynamic> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    return json.decode(response)['data']['azkr'];
  }

  @override
  void initState() {
    fetchedAzkar = readJson();
    super.initState();
  }

  List<Map<String, dynamic>> athkars = [];

  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    dynamic arg = ModalRoute.of(context)!.settings.arguments;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          title: Text(
            'أذكار المساء',
            style: GoogleFonts.amiri(fontSize: 25),
          ),
        ),
        body: FutureBuilder<dynamic>(
          // future: _fetchImage(),
          future: fetchedAzkar,
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
                      controller: controller,
                      scrollDirection: Axis.horizontal,
                      itemCount: 30,
                      itemBuilder: (context, index) {
                        if ('masaaitems' == arg) {
                          return TextZekr(
                            color:
                                snapshot.data['masaaitems'][index]['int'] <= 0
                                    ? Colors.red
                                    : blue,
                            count: snapshot.data['masaaitems'][index]['int'],
                            onTap: () {
                              setState(() {
                                setState(() {
                                  snapshot.data['masaaitems'][index]['int'] -=
                                      1;
                                  if (snapshot.data['masaaitems'][index]
                                          ['int'] <=
                                      0) {
                                    snapshot.data['masaaitems'][index]['int'] =
                                        0;
                                  }
                                });
                              });
                            },
                            zekr: snapshot.data['masaaitems'][index]['zekr'],
                            description: snapshot.data['masaaitems'][index]
                                ['description'],
                            reference: snapshot.data['masaaitems'][index]
                                ['reference'],
                            bookmark: () {},
                          );
                        }
                        return null;
                      },
                    );
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
