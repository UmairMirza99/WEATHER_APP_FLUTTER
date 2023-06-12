class WeatherDataHourly {
  final List<Hourly> hourly;
  WeatherDataHourly({required this.hourly});
  factory WeatherDataHourly.fromJson(Map<String, dynamic> json) =>
      WeatherDataHourly(
          hourly:
              List<Hourly>.from(json['hourly'].map((e) => Hourly.fromJson(e))));
}

class Hourly {
  var temp;
  int? dt;
  int? pressure;
  int? humidity;
  int? clouds;
  var windSpeed;
  List<Weather>? weather;

  Hourly(
      {required this.temp,
      this.dt,
      this.pressure,
      this.humidity,
      this.clouds,
      this.windSpeed,
      this.weather});

  factory Hourly.fromJson(json) {
    return Hourly(
        temp: json['temp'],
        dt: json['dt'],
        pressure: json['pressure'],
        humidity: json['humidity'],
        clouds: json['clouds'],
        windSpeed: json['wind_speed'],
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList());
  }

  // Map<String, dynamic> toJson() => {
  //       'temp': temp,
  //       'dt': dt,
  //       'pressure': pressure,
  //       'humidity': humidity,
  //       'clouds': clouds,
  //       'wind_speed': windSpeed,
  //       'weather': weather?.map((e) => e.toJson()).toList()
  //     };
}

class Weather {
  int? id;
  String? main, description, icon;

  Weather({this.id, this.main, this.description, this.icon});
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon']);
  }
  Map<String, dynamic> toJson() =>
      {'id': id, 'main': main, 'description': description, 'icon': icon};
}
