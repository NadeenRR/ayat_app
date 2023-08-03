import 'package:ayat_app/utils/constant.dart';
import 'package:ayat_app/widgets/my_category_zker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Azkar extends StatefulWidget {
  const Azkar({super.key});

  @override
  State<Azkar> createState() => _AzkarState();
}

class _AzkarState extends State<Azkar> {
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
            'أذكاري',
            style: GoogleFonts.amiri(fontSize: 25),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 12, vertical: 12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MyCategoryZker(
                        onTap: () => Navigator.pushNamed(context, '/alsabah',
                            arguments: 'asab'),
                        text: 'أذكار الصباح',
                      ),
                    ),
                    Expanded(
                      child: MyCategoryZker(
                        onTap: () => Navigator.pushNamed(context, '/almasaa',
                            arguments: 'masaaitems'),
                        text: 'أذكار المساء',
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MyCategoryZker(
                        onTap: () => Navigator.pushNamed(context, '/type',
                            arguments: 'أذكار الصباح'),
                        text: 'أذكار النوم',
                      ),
                    ),
                    Expanded(
                      child: MyCategoryZker(
                        onTap: () => Navigator.pushNamed(context, '/type',
                            arguments: 'أذكار المساء'),
                        text: 'أذكار الاستيقاظ',
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MyCategoryZker(
                        onTap: () => Navigator.pushNamed(context, '/type',
                            arguments: 'أذكار الصباح'),
                        text: 'الرقية بالقرآن',
                      ),
                    ),
                    Expanded(
                      child: MyCategoryZker(
                        onTap: () => Navigator.pushNamed(context, '/type',
                            arguments: 'أذكار المساء'),
                        text: 'الرقية بالسنة',
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MyCategoryZker(
                        onTap: () => Navigator.pushNamed(context, '/type',
                            arguments: 'أذكار الصباح'),
                        text: 'تسابيح',
                      ),
                    ),
                    Expanded(
                      child: MyCategoryZker(
                        onTap: () => Navigator.pushNamed(context, '/type',
                            arguments: 'أذكار المساء'),
                        text: 'أذكار الآذان',
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MyCategoryZker(
                        onTap: () => Navigator.pushNamed(context, '/type',
                            arguments: 'أذكار الصباح'),
                        text: 'أذكار بعد الصلاة',
                      ),
                    ),
                    Expanded(
                      child: MyCategoryZker(
                        onTap: () => Navigator.pushNamed(context, '/type',
                            arguments: 'أذكار المساء'),
                        text: 'فضل الصلاة على النبي',
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MyCategoryZker(
                        onTap: () => Navigator.pushNamed(context, '/type',
                            arguments: 'أذكار الصباح'),
                        text: 'أذكار الصباح',
                      ),
                    ),
                    Expanded(
                      child: MyCategoryZker(
                        onTap: () => Navigator.pushNamed(context, '/type',
                            arguments: 'أذكار المساء'),
                        text: 'أذكار المساء',
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MyCategoryZker(
                        onTap: () => Navigator.pushNamed(context, '/type',
                            arguments: 'أذكار الصباح'),
                        text: 'أذكار الصباح',
                      ),
                    ),
                    Expanded(
                      child: MyCategoryZker(
                        onTap: () => Navigator.pushNamed(context, '/type',
                            arguments: 'أذكار المساء'),
                        text: 'أذكار المساء',
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MyCategoryZker(
                        onTap: () => Navigator.pushNamed(context, '/type',
                            arguments: 'أذكار الصباح'),
                        text: 'أذكار الصباح',
                      ),
                    ),
                    Expanded(
                      child: MyCategoryZker(
                        onTap: () => Navigator.pushNamed(context, '/type',
                            arguments: 'أذكار المساء'),
                        text: 'أذكار المساء',
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MyCategoryZker(
                        onTap: () => Navigator.pushNamed(context, '/type',
                            arguments: 'أذكار الصباح'),
                        text: 'أذكار الصباح',
                      ),
                    ),
                    Expanded(
                      child: MyCategoryZker(
                        onTap: () => Navigator.pushNamed(context, '/type',
                            arguments: 'أذكار المساء'),
                        text: 'أذكار المساء',
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MyCategoryZker(
                        onTap: () => Navigator.pushNamed(context, '/type',
                            arguments: 'أذكار الصباح'),
                        text: 'أذكار الصباح',
                      ),
                    ),
                    Expanded(
                      child: MyCategoryZker(
                        onTap: () => Navigator.pushNamed(context, '/type',
                            arguments: 'أذكار المساء'),
                        text: 'أذكار المساء',
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // FutureBuilder<dynamic>(
    //   // future: _fetchImage(),
    //   future: fetchedAzkar,
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
    //           : Padding(
    //               padding: const EdgeInsetsDirectional.symmetric(
    //                   horizontal: 12, vertical: 12),
    //               child: GridView.builder(
    //                 itemCount: snapshot.data.length,
    //                 gridDelegate:
    //                     const SliverGridDelegateWithFixedCrossAxisCount(
    //                   crossAxisCount: 2,
    //                   crossAxisSpacing: 4.0,
    //                   mainAxisSpacing: 4.0,
    //                 ),
    //                 itemBuilder: (BuildContext context, int index) {
    //                   return Card(
    //                     color: blue,
    //                     child:
    //                         Text('${snapshot.data['asab'][index]['zekr']}'),
    //                   );
    //                 },
    //               ),
    //             );
    //     }
    //     return const Text(
    //       'no data yet',
    //       style: TextStyle(color: Colors.white),
    //     );
    //   },
    // ),
  }
}
  // Widget surahItem({required int count}) {
  //   return Padding(
  //     padding: EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 8),
  //     child: GridView.builder(
  //       itemCount: 3,
  //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //           crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
  //       itemBuilder: (BuildContext context, int index) {
  //         return Card(
  //           color: blue,
  //           child: Text('$index'),
  //         );
  //       },
  //     ),
  //   );
  // }

