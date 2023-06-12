import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wether_app/controller/global_controller.dart';

import '../widgets/Header.dart';
import '../widgets/Humidity_Slider.dart';
import '../widgets/IconWithTemperaturWidget.dart';
import '../widgets/ListDailyData.dart';
import '../widgets/ListHourlyDetail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() => globalController.checkLoading().isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  Header(
                    placemark: globalController.getPlaceMark(),
                  ),
                  IconWithTeperatur(
                    currentData: globalController.getCurrentData().current!,
                  ),
                  HourlyDetailList(
                    weatherDataHourly:
                        globalController.getCurrentData().hourly!,
                  ),
                  DaiyWeatherList(
                    dailyWeather: globalController.getCurrentData().daily!,
                  ),
                  CirculerSliderHumidity(
                    weatherDataCurrent:
                        globalController.getCurrentData().current!,
                  )
                ],
              )),
      ),
    );
  }
}
