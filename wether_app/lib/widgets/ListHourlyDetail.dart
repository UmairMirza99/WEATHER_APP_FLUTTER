import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wether_app/module/HourlyWeather.dart';

class HourlyDetailList extends StatelessWidget {
  HourlyDetailList({Key? key, required this.weatherDataHourly})
      : super(key: key);
  WeatherDataHourly weatherDataHourly;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 107,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: weatherDataHourly.hourly.length,
          itemBuilder: (context, index) {
            return detailWidget(index);
          }),
    );
  }

  Widget detailWidget(int index) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.black12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${(weatherDataHourly.hourly[index].temp - 271).toInt()}°',
            style: const TextStyle(fontSize: 18),
          ),
          Image(
            image: AssetImage(
                'assets/weather/${weatherDataHourly.hourly[index].weather![0].icon}.png'),
            height: 40,
          ),
          Text(changeFormate(weatherDataHourly.hourly[index].dt))
        ],
      ),
    );
  }

  String changeFormate(int? timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp! * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }
}
