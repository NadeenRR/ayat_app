import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SurahPageView extends StatefulWidget {
  final int imageNumber;

  const SurahPageView({super.key, required this.imageNumber});

  @override
  State<SurahPageView> createState() => _SurahPageViewState();
}

class _SurahPageViewState extends State<SurahPageView> {
  bool _containerVisible = false;

  void _toggleGlassesContainerVisibility() {
    setState(() {
      _containerVisible = !_containerVisible;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(children: [
          PageView.builder(
            itemCount: 604,
            controller: PageController(initialPage: widget.imageNumber - 1),
            itemBuilder: (context, index) {
              final int imageNumber = index + 1;
              return GestureDetector(
                onTap: _toggleGlassesContainerVisibility,
                child: Image.asset(
                  'assets/quranImages/$imageNumber.png',
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
          if (_containerVisible)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(166, 14, 14, 14),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                        Text(
                          'بحث',
                          style: GoogleFonts.tajawal(
                              color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),

                    Column(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.list,
                            color: Colors.white,
                            size: 34,
                          ),
                        ),
                        Text(
                          'الفهرس',
                          style: GoogleFonts.tajawal(
                              color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.share_outlined,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                        Text(
                          'مشاركة',
                          style: GoogleFonts.tajawal(
                              color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.volunteer_activism,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                        Text(
                          'دعاء الختم',
                          style: GoogleFonts.tajawal(
                              color: Colors.white, fontSize: 16),
                        )
                      ],
                    )
                    // Add more widgets as needed
                  ],
                ),
              ),
            ),
        ]),
      ),
    );
  }
}
