import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/model/weatherData.dart';
import 'package:weather_app/service/fetch_weather.dart';

class DataController extends GetxController {
//create variables
  final RxBool _isloading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

//instance called
  RxBool checkLoading() => _isloading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;
  final weatherData =WeatherData().obs;

WeatherData  getData(){
    return weatherData.value;
  }

  @override
  void onInit() {
    if (_isloading.isTrue) {
      getLocation();
    }

    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    // print('inside getLoction1');

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

//return if service is not enabled

    if (!isServiceEnabled) {
      print('Location services are disabled.');
     
       
      //return Future.error("Location not enabled.");
    }
     print('inside getLoction2');
    //status of permission
    locationPermission = await Geolocator.checkPermission();

   if (locationPermission == LocationPermission.denied) {
      //requestPermission
      locationPermission = await Geolocator.requestPermission();

      if (locationPermission == LocationPermission.denied) {
        return 
        //  print('Location permissions are denied');
         Future.error("Location permission is denied.");
      }
         print('inside getLoction3');
    }
   // print('inside getLoction4');
     if (locationPermission == LocationPermission.deniedForever) {
      
      //  print(   'Location permissions are permanently denied, we cannot request permissions.');
      return Future.error("Location permission is denied forever.");

    } 
 print('inside getLoction5');
    //getting the current location
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
//update lat and long values
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;

      //calling weather api
      return FetchWeatherAPI().processData(value.latitude, value.longitude).then((value) {
        weatherData.value=value;
_isloading.value = false;

      });
      
    });
  }
}
