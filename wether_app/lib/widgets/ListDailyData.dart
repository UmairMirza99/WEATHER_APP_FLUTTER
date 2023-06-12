import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wether_app/module/DailyWeather.dart';

class DaiyWeatherList extends StatelessWidget {
  DaiyWeatherList({Key? key, required this.dailyWeather}) : super(key: key);
  WeatherDataDaily dailyWeather;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 450,
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(10)),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: dailyWeather.daily.length,
          itemBuilder: (context, index) {
            return DailyWidget(index);
          }),
    );
  }

  Widget DailyWidget(int index) {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 5, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${changeFormate(day: dailyWeather.daily[index].dt)}')
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(
                    'assets/weather/${dailyWeather.daily[index].weather![0].icon}.png'),
                height: 50,
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  '${((dailyWeather.daily[index].temp?.max)! - 271).toInt()}°/${((dailyWeather.daily[index].temp?.min)! - 271).toInt()}°')
            ],
          ),
        ],
      ),
    );
  }

  String changeFormate({int? day}) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day! * 1000);
    String x = DateFormat('EEE').format(time);
    return x;
  }
}
