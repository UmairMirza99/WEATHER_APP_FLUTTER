class WeatherDataCurrent {
  final Current current;

  WeatherDataCurrent({required this.current});
  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(current: Current.fromJson(json['current']));
}

class Current {
  double? temp;
  int? pressure;
  int? humidity;
  double? uvi;
  double? feelsLike;
  int? clouds;
  double? windSpeed;
  List<Weather>? weather;

  Current(
      {this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.clouds,
      this.uvi,
      this.windSpeed,
      this.weather});

  factory Current.fromJson(json) {
    return Current(
        temp: json['temp'],
        feelsLike: json['feels_like'],
        pressure: json['pressure'],
        uvi: json['uvi'],
        humidity: json['humidity'],
        clouds: json['clouds'],
        windSpeed: json['wind_speed'],
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList());
  }

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'pressure': pressure,
        'uvi': uvi,
        'humidity': humidity,
        'clouds': clouds,
        'wind_speed': windSpeed,
        'weather': weather?.map((e) => e.toJson()).toList()
      };
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
