import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wether_app/Api/FetchData.dart';

import '../module/WeatherDataFinal.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  final wetherData = WeatherDataFinal().obs;
  final place = Placemark().obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;

  @override
  void onInit() {
    // TODO: implement onInit
    getLocation();
    super.onInit();
  }

  WeatherDataFinal getCurrentData() {
    return wetherData.value;
  }

  Placemark getPlaceMark() {
    return place.value;
  }

  getLocation() async {
    bool isLocationServicesEnabled;
    isLocationServicesEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission locationPermission =
        await Geolocator.requestPermission();
    if (!isLocationServicesEnabled) {
      // return Future.error('Location Not Enabled');
      return Get.defaultDialog(
          middleText:
              'Your Location is off!. Turn On Location and Restart the application',
          title: 'Location',
          actions: [
            TextButton(
                onPressed: () async {
                  await Geolocator.openLocationSettings();
                },
                child: const Text('Turn on Location'))
          ]).then((value) {
        getLocation();
      });
    }
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error('Location Permission Are Denied Forever');
    } else if (locationPermission == LocationPermission.denied) {
      return Future.error('Location Permission is Denied');
    }
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('Lat', value.latitude.toString());
      prefs.setString('Lon', value.longitude.toString());
      _longitude.value = value.longitude;
      _latitude.value = value.latitude;
      await cityName(value.latitude, value.longitude).then((value) {
        place.value = value[0];
      });
      return FetchData()
          .processData(value.latitude, value.longitude)
          .then((value) {
        wetherData.value = value;
        _isLoading.value = false;
      });
    });
  }

  Future<List<Placemark>> cityName(var lat, var long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    return placemarks;
  }
}
