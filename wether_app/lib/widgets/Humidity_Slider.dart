import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:wether_app/module/CurrentWeatherData.dart';

class CirculerSliderHumidity extends StatelessWidget {
  CirculerSliderHumidity({Key? key, required this.weatherDataCurrent})
      : super(key: key);
  WeatherDataCurrent weatherDataCurrent;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
          height: 1,
          child: const Divider(),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          height: 250,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              const Text(
                'Comfort Level',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                      infoProperties: InfoProperties(
                        bottomLabelText: 'Humidity',
                        bottomLabelStyle: const TextStyle(
                            fontSize: 13, height: 1.5, letterSpacing: 1),
                      ),
                      animationEnabled: true),
                  onChange: (double value) {}),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Feels Like: ',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                            '${((weatherDataCurrent.current.feelsLike!) - 271).toInt()}')
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Uvi Index: ',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text('${weatherDataCurrent.current.uvi!}')
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
