import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wether_app/module/CurrentWeatherData.dart';

import '../Colors/ColorsApp.dart';

class IconWithTeperatur extends StatelessWidget {
  IconWithTeperatur({Key? key, required this.currentData}) : super(key: key);
  WeatherDataCurrent currentData;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            dateTime(),
            style: const TextStyle(color: whiteColor, fontSize: 15),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/weather/${currentData.current.weather?[0].icon}.png'),
                        fit: BoxFit.cover)),
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: '${currentData.current.temp!.toInt() - 271}°',
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 68,
                        color: Colors.black)),
                TextSpan(
                    text: '${currentData.current.weather?[0].description}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ])),
            ],
          ),
        ),
        MoreDetailsWidget(context)
      ],
    );
  }

  String dateTime() {
    DateTime date = DateTime.now();
    String dateFormat = DateFormat('MMM/d/y\n  EEEEEEE').format(date);

    return dateFormat;
  }

  Widget MoreDetailsWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: MediaQuery.of(context).size.width,
      height: 107,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.black12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/icons/windspeed.png'),
                  height: 35,
                ),
                const Padding(padding: EdgeInsets.only(top: 5)),
                Text('${currentData.current.windSpeed} Km/s'),
                const Padding(padding: EdgeInsets.only(top: 5)),
                const Text(
                  'Wind',
                  style: TextStyle(color: Colors.black26),
                )
              ],
            ),
          ),
          Container(
            width: 1,
            height: 55,
            color: Colors.grey,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/icons/humidity.png'),
                  height: 35,
                ),
                const Padding(padding: EdgeInsets.only(top: 5)),
                Text('${currentData.current.humidity}%'),
                const Padding(padding: EdgeInsets.only(top: 5)),
                const Text(
                  'Humidity',
                  style: TextStyle(color: Colors.black26),
                )
              ],
            ),
          ),
          Container(
            width: 1,
            height: 55,
            color: Colors.grey,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/icons/clouds.png'),
                  height: 35,
                ),
                const Padding(padding: EdgeInsets.only(top: 5)),
                Text('${currentData.current.clouds}%'),
                const Padding(padding: EdgeInsets.only(top: 5)),
                const Text(
                  'Cloud',
                  style: TextStyle(color: Colors.black26),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
