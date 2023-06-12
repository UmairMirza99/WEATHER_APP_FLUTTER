import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wether_app/module/CurrentWeatherData.dart';
import 'package:wether_app/module/DailyWeather.dart';
import 'package:wether_app/module/HourlyWeather.dart';

import '../module/WeatherDataFinal.dart';
import 'apiKey.dart';

class FetchData {
  WeatherDataFinal? wetherData;
  Future<WeatherDataFinal> processData(var lat, var lon) async {
    var response = await http.get(Uri.parse(apiUrl(lat, lon)));
    var jsonString = jsonDecode(response.body);
    wetherData = WeatherDataFinal(
        current: WeatherDataCurrent.fromJson(jsonString),
        hourly: WeatherDataHourly.fromJson(jsonString),
        daily: WeatherDataDaily.fromJson(jsonString));
    return wetherData!;
  }

  String apiUrl(var lat, var lon) {
    String url =
        'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey';
    return url;
  }
}
