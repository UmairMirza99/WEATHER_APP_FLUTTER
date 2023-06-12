import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import '../Colors/ColorsApp.dart';

class Header extends StatelessWidget {
  Header({Key? key, required this.placemark}) : super(key: key);
  Placemark placemark;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.location_on,
            color: Colors.white,
          ),
          Text(
            '${placemark.locality}',
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, color: whiteColor),
          )
        ],
      ),
    );
  }
}
