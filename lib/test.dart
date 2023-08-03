// import 'package:flutter/material.dart';

// class ListViewPage extends StatelessWidget {
//   final Map<int, int> listItemToImage = {
//     1: 1,
//     2: 2,
//     3: 50,
//     4: 77,
//     5: 106,
//     6: 128,
//     7: 151,
//     8: 177,
//     9: 187,
//     10: 208,
//     11: 221,
//     12: 235,
//     13: 249,
//     14: 255,
//     15: 262,
//     16: 267,
//     17: 282,
//     18: 293,
//     19: 305,
//     20: 312,
//     21: 322,
//     22: 332,
//     23: 342,
//     24: 350,
//     25: 359,
//     26: 367,
//     27: 377,
//     28: 385,
//     29: 396,
//     30: 404,
//     31: 411,
//     32: 415,
//     33: 418,
//     34: 428,
//     35: 434,
//     36: 440,
//     37: 446,
//     38: 453,
//     39: 458,
//     40: 467,
//     41: 477,
//     42: 483,
//     43: 489,
//     44: 496,
//     45: 499,
//     46: 502,
//     47: 507,
//     48: 511,
//     49: 515,
//     50: 518,
//     51: 520,
//     52: 523,
//     53: 526,
//     54: 528,
//     55: 531,
//     56: 534,
//     57: 537,
//     58: 542,
//     59: 545,
//     60: 549,
//     61: 551,
//     62: 553,
//     63: 554,
//     64: 556,
//     65: 558,
//     66: 560,
//     67: 562,
//     68: 564,
//     69: 566,
//     70: 568,
//     71: 570,
//     72: 572,
//     73: 574,
//     74: 575,
//     75: 577,
//     76: 578,
//     77: 580,
//     78: 582,
//     79: 583,
//     80: 585,
//     81: 586,
//     82: 587,
//     83: 587,
//     84: 589,
//     85: 590,
//     86: 591,
//     87: 591,
//     88: 592,
//     89: 593,
//     90: 594,
//     91: 595,
//     92: 595,
//     93: 596,
//     94: 596,
//     95: 597,
//     96: 597,
//     97: 598,
//     98: 598,
//     99: 599,
//     100: 599,
//     101: 600,
//     102: 600,
//     103: 601,
//     104: 601,
//     105: 601,
//     106: 602,
//     107: 602,
//     108: 602,
//     109: 603,
//     110: 603,
//     111: 603,
//     112: 604,
//     113: 604,
//     114: 604,
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('List View Page')),
//       body: ListView.builder(
//         itemCount: listItemToImage.length,
//         itemBuilder: (context, index) {
//           final itemNumber = index + 1;
//           return ListTile(
//             title: Text('Item $itemNumber'),
//             onTap: () {
//               final imageNumber = listItemToImage[itemNumber];
//               if (imageNumber != null) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         ImageViewPage(imageNumber: imageNumber),
//                   ),
//                 );
//               }
//             },
//           );
//         },
//       ),
//     );
//   }
// }
// import 'package:ayat_app/utils/constant.dart';
// import 'package:flutter/material.dart';

// class ImageViewPage extends StatelessWidget {
//   final int imageNumber;

//   const ImageViewPage({super.key, required this.imageNumber});

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         body: PageView.builder(
//           itemCount: 604,
//           controller: PageController(initialPage: imageNumber - 1),
//           itemBuilder: (context, index) {
//             final int imageNumber = index + 1;
//             return Image.asset(
//               'assets/quranImages/$imageNumber.png',
//               fit: BoxFit.fill,
//             );
//             // Container(
//             //   decoration: BoxDecoration(
//             //     image: DecorationImage(
//             //       fit: BoxFit.fill,
//             //       image: AssetImage('assets/quranImages/$imageNumber.png'),
//             //     ),
//             //   ),
//             // );
//           },
//         ),
//       ),
//     );
//   }
// }

// class ImageListPage extends StatefulWidget {
//   ImageListPage({Key? key}) : super(key: key);

//   @override
//   State<ImageListPage> createState() => _ImageListPageState();
// }

// class _ImageListPageState extends State<ImageListPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Image List'),
//         ),
//         body: ListView.builder(
//           itemCount: pageNumbers.length,
//           itemBuilder: (context, index) => GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ImagePage(
//                     imageNumber: pageNumbers[index],
//                   ),
//                 ),
//               );
//             },
//             child: ListTile(
//               title: Text('Image ${index + 1}'),
//               leading: Image.asset(
//                 'assets/quranImages/${pageNumbers[index]}.png',
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ImagePage extends StatelessWidget {
//   final int imageNumber;

//   const ImagePage({Key? key, required this.imageNumber}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         body: PageView.builder(
//           itemCount: 604,
//           itemBuilder: (context, index) => Center(
//             child: Image.asset(
//               'assets/quranImages/${index + 1}.png',
//               fit: BoxFit.fitWidth,
//             ),
//           ),
//           controller: PageController(
//             initialPage: imageNumber - 1,
//           ),
//         ),
//       ),
//     );
//   }
// }
