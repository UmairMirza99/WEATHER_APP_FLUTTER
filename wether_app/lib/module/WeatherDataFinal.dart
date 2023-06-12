import 'package:wether_app/module/CurrentWeatherData.dart';
import 'package:wether_app/module/HourlyWeather.dart';

import 'DailyWeather.dart';

class WeatherDataFinal {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  final WeatherDataDaily? daily;

  WeatherDataFinal({this.current, this.hourly, this.daily});
  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataHourly getCurrentHourly() => hourly!;
  WeatherDataDaily getCurrentDaily() => daily!;
}
