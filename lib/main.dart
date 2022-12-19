import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/view/screens/ScreenHome.dart';

void main(List<String> args) {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weather App",
      
      home: ScreenHome(),

    );
    
  }
}