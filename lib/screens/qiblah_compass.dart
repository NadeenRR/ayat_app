import 'dart:math';
import 'package:ayat_app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

class QiblahCompassPage extends StatefulWidget {
  const QiblahCompassPage({super.key});

  @override
  _QiblahCompassPageState createState() => _QiblahCompassPageState();
}

class _QiblahCompassPageState extends State<QiblahCompassPage> {
  double _qiblahDirection = 0.0;
  String _locationStatus = '';

  @override
  void initState() {
    print('ccc');

    _getLocation();
    print('ddd');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Text(
          'اتجاه القبلة',
          style: GoogleFonts.amiri(fontSize: 25),
        ),
      ),
      body: Center(
        child: Transform.rotate(
            angle: -_qiblahDirection,
            child: Image.asset(
              'assets/images/qibla.png',
              height: MediaQuery.of(context).size.height / 2.5,
            )),
      ),
    );
  }

  Future<void> _getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      double lat = position.latitude;
      double lng = position.longitude;

      double qiblahDirection =
          _calculateQiblahDirection(lat, lng, 21.4225, 39.8262);
      setState(() {
        _qiblahDirection = qiblahDirection;
        _locationStatus = 'Location: ${lat.toStringAsFixed(4)},'
            ' ${lng.toStringAsFixed(4)}';
      });
      print(lat);
      print(lng);
    } catch (e) {
      setState(() {
        _locationStatus = 'Failed to get location';
      });
    }
  }

  double _calculateQiblahDirection(
      double lat1, double lng1, double lat2, double lng2) {
    double qiblahDirection = 0.0;

    lat1 = _toRadians(lat1);
    lng1 = _toRadians(lng1);
    lat2 = _toRadians(lat2);
    lng2 = _toRadians(lng2);

    double lngDiff = lng2 - lng1;

    double y = sin(lngDiff) * cos(lat2);
    double x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(lngDiff);
    qiblahDirection = _toDegrees(atan2(y, x));

    qiblahDirection = (qiblahDirection + 360.0) % 360.0;

    return qiblahDirection;
  }

  double _toRadians(double degree) {
    return degree * pi / 180.0;
  }

  double _toDegrees(double radian) {
    return radian * 180.0 / pi;
  }
}
